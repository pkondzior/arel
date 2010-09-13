module Arel
  module Nodes
    class Having < Base
      attr_accessor :expr

      def initialize expr
        @expr = expr
      end
      
      def to_sql
        "HAVING #{self.expr.to_sql}"
      end
    end
  end
end
