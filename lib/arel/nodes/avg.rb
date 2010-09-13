module Arel
  module Nodes
    class Avg < Arel::Nodes::Function
      def to_sql
        "AVG(#{self.expressions.map { |x|
        self.cast_sql(x) }.join(', ')})#{self.alias ? " AS #{self.cast_sql(self.alias)}" : ''}"
      end
    end
  end
end
