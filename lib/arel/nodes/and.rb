module Arel
  module Nodes
    class And < Arel::Nodes::Binary
      def to_sql
        "#{self.cast_sql(self.left)} AND #{self.cast_sql(self.right)}"
      end
    end
  end
end
