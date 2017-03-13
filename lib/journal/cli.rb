module Journal
  module CLI
    extend self

    def run
      usage_and_quit unless valid_day?(day)

      edit_day(day)
      # ..and git commit?!
    end

    def edit_day(day)
      date = Journal::Names.day_to_date(day)
      filename = Journal::Names.filename_for_date(date)

      system("#{ENV['EDITOR']} #{filename}")
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
