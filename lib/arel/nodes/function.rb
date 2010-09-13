module Arel
  module Nodes
    class Function < Base
      attr_accessor :expressions, :alias

      def initialize expr, aliaz = nil
        @expressions = expr
        @alias       = aliaz
      end

      def as aliaz
        self.alias = SqlLiteral.new(aliaz)
        self
      end
    end
  end
end
