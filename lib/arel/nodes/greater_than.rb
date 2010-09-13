module Arel
  module Nodes
    class GreaterThan < Arel::Nodes::Binary
      def to_sql
        "#{self.cast_sql(self.left)} > #{self.cast_sql(self.right)}"
      end
    end
  end
end