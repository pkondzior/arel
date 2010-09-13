module Arel
  module Nodes
    class UnqualifiedColumn
      def initialize attribute
        @attribute = attribute
      end

      def name
        @attribute.name
      end

      def to_sql
        "#{Arel::Table.engine.connection.quote_column_name self.name}"
      end
    end
  end
end
