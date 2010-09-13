module Arel
  module Nodes
    class On < Base
      attr_accessor :expr

      def initialize expr
        @expr = expr
      end

      def to_sql
        "ON #{self.expr.to_sql}"
      end
    end
  end
end
