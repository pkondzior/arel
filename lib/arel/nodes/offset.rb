module Arel
  module Nodes
    class Offset < Base
      attr_accessor :value

      def initialize value
        @value = value
      end

      def to_sql
        "OFFSET #{self.cast_sql(self.value)}"
      end
    end
  end
end
