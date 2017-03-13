module Journal
  module Configuration
    extend self

    JOURNAL_PATH = '~/journal'

    def journal_path
      File.expand_path(JOURNAL_PATH)
    end
  end
end
