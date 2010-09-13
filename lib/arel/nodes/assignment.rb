module Arel
  module Nodes
    class Assignment < Arel::Nodes::Binary

      def to_sql
        "#{self.cast_sql(left)} = #{self.right.nil? ? 'NULL' : self.cast_sql(self.right)}"
      end
    end
  end
end
