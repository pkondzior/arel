module Arel
  module Nodes
    class Or < Arel::Nodes::Binary
      def to_sql
        "#{self.cast_sql(self.left)} OR #{self.cast_sql(self.right)}"
      end
    end
  end
end
