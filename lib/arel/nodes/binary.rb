module Arel
  module Nodes
    class Binary < Base
      attr_accessor :left, :right

      def initialize left, right
        @left  = left
        @right = right
      end

      def or right
        Nodes::Or.new self, right
      end

      def and right
        Nodes::And.new self, right
      end
    end
  end
end
