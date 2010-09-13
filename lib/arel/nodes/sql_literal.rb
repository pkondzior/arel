module Arel
  module Nodes
    class SqlLiteral < String
      def count distinct = false
        Count.new [self], distinct
      end

      def maximum
        Nodes::Max.new [self], Nodes::SqlLiteral.new('max_id')
      end

      def to_sql
        self
      end
    end
  end
end
