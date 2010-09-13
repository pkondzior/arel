module Arel
  module Nodes
    class OuterJoin < Arel::Nodes::Join

      def to_sql(join_source = true)
        if join_source
          "#{self.cast_sql(self.left)} OUTER JOIN #{self.cast_sql(self.right)} #{self.cast_sql(self.constraint)}"
        else
          "OUTER JOIN #{self.cast_sql(self.right)} #{self.cast_sql(self.constraint)}"
        end
      end
    end
  end
end
