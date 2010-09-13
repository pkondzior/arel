module Arel
  module Nodes
    class Equality < Arel::Nodes::Binary
      def operator; :== end
      alias :operand1 :left
      alias :operand2 :right

      def to_sql
        if self.right.nil?
          "#{self.cast_sql(self.left)} IS NULL"
        else
          "#{self.cast_sql(self.left)} = #{self.cast_sql(right)}"
        end
      end
    end
  end
end
