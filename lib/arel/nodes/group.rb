module Arel
  module Nodes
    class Group
      attr_accessor :expr

      def initialize expr
        @expr = expr
      end

      def to_sql
        self.expr.to_sql
      end
    end
  end
end
