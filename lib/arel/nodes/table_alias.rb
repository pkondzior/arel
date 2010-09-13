module Arel
  module Nodes
    class TableAlias < Base
      attr_reader :name, :relation, :columns

      def initialize name, relation
        @name     = name
        @relation = relation
        @columns  = relation.columns.map { |column|
          column.dup.tap { |col| col.relation = self }
        }
      end

      def [] name
        name = name.to_sym
        columns.find { |column| column.name == name }
      end

      def to_sql
        "#{self.cast_sql(self.relation)} #{Arel::Table.engine.connection.quote_table_name self.name}"
      end
    end
  end
end
