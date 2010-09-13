module Arel
  module Nodes
    class Max < Arel::Nodes::Function
      def to_sql
        "MAX(#{self.expressions.map { |x|
        self.cast_sql(x) }.join(', ')})#{self.alias ? " AS #{self.cast_sql(self.alias)}" : ''}"
      end
    end
  end
end
