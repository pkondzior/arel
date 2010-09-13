module Arel
  module Nodes
    class Values < Base
      attr_accessor :expressions

      def initialize exprs
        @expressions = exprs
      end

      def to_sql
        "VALUES (#{self.expressions.map { |value|
        value.nil? ? 'NULL' : self.cast_sql(value)
        }.join ', '})"
      end
    end
  end
end
