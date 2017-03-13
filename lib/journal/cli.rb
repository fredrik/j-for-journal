module Journal
  module CLI
    extend self

    def run
      usage_and_quit unless valid_day?(day)

      date = Journal::Names.day_to_date(day)
      filename = Journal::Names.filename_for_date(date)

      edit_journal_page(filename)
      commit_journal_page(filename, date)
    end

    def edit_journal_page(filename)
      system("#{ENV['EDITOR']} #{filename}")
    end

    def commit_journal_page(filename, date)
      # If the file has changed, we should commit it.
      # The message is the weekday, e.g. 'monday'.
      # We might want to add a qualifier too, like 'monday morning' or 'friday afternoon'.
      repo = Journal::Configuration::JOURNAL_PATH
      message = date.strftime("%A").downcase
      system("cd #{repo} && git add #{filename} && git commit #{filename} -m #{message}")
    end

    private

    def usage_and_quit
      puts "Usage:"
      puts "$> journal [today|tomorrow|yesterday]"
      abort
    end

    def day
      ARGV.first || 'today'
    end

    def days
      %w(yesterday today tomorrow)
    end

    def valid_day?(day)
      days.include?(day)
    end
  end
end
