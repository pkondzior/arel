module Arel
  module Nodes
    class InnerJoin < Arel::Nodes::Join
      def to_sql(single_source = true)
        if single_source
          "#{self.cast_sql(self.left)} INNER JOIN #{self.cast_sql(self.right)} #{self.cast_sql(self.constraint) if self.constraint}"
        else
          "INNER JOIN #{self.cast_sql(self.right)} #{self.cast_sql(self.constraint) if self.constraint}"
        end
      end
    end
  end
end
