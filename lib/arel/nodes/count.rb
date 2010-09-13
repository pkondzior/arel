module Arel
  module Nodes
    class Count < Arel::Nodes::Function
      include Arel::Expression

      attr_accessor :distinct

      def initialize expr, distinct = false, aliaz = nil
        super(expr, aliaz)
        @distinct = distinct
      end

      def to_sql
        "COUNT(#{self.distinct ? 'DISTINCT ' : ''}#{self.expressions.map { |x|
        self.cast_sql(x)
        }.join(', ')})#{self.alias ? " AS #{self.cast_sql(self.alias)}" : ''}"
      end
    end
  end
end
