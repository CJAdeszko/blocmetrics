module Faker
  class Events < Base
    class << self
      def name
        parse('events.name')
      end
    end
  end
end
