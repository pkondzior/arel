module Arel
  module Nodes
    class LeftOuterJoin < Arel::Nodes::Join

      def to_sql
        "#{self.cast_sql(self.left)} LEFT OUTER JOIN #{self.cast_sql(self.right)} #{self.cast_sql(self.constraint)}"
      end
    end
  end
end
