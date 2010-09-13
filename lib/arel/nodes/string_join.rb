module Arel
  module Nodes
    class StringJoin < Arel::Nodes::Join
      undef :constraint

      def initialize left, right
        super(left, right, nil)
      end

      def to_sql
        "#{self.cast_sql(o.left)} #{self.cast_sql(o.right)}"
      end
    end
  end
end
