module Arel
  module Nodes
    class NotEqual < Arel::Nodes::Binary
      def to_sql

        if self.right.nil?
          "#{self.cast_sql(self.left)} IS NOT NULL"
        else
          "#{self.cast_sql(self.left)} != #{self.cast_sql(self.right)}"
        end
      end
    end
  end
end
