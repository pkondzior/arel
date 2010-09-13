module Arel
  module Nodes
    class Sum < Arel::Nodes::Function
      def to_sql
        "SUM(#{self.expressions.map { |x|
        self.cast_sql(x) }.join(', ')})#{self.alias ? " AS #{self.cast_sql(self.alias)}" : ''}"
      end
    end
  end
end
