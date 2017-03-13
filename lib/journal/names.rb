require 'date'

module Journal
  module Names
    extend self

    def day_to_date(day)
      # Convert a string such as 'today' or 'tomorrow' to a Date object.
      case day
      when 'today'
        Date.today
      when 'tomorrow'
        Date.today + 1
      when 'yesterday'
        Date.today - 1
      else
        raise ArgumentError.new("Unknown day '#{day}'")
      end
    end

    def filename_for_date(date)
      date_str = date.strftime('%Y-%m-%d') # TODO: where does this live?
      File.join(Journal::Configuration.journal_path, date_str)
    end
  end
end
