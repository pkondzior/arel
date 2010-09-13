module Arel
  module Nodes
    class InsertStatement < Base
      attr_accessor :relation, :columns, :values

      def initialize
        @relation = nil
        @columns  = []
        @values   = nil
      end

      def initialize_copy other
        super
        @columns = @columns.clone
        @values =  @values.clone if @values
      end

      def to_sql
        [
          "INSERT INTO #{self.cast_sql self.relation}",

          ("(#{self.columns.map { |x|
            Arel::Table.engine.connection.quote_column_name x.name
            }.join ', '})" unless self.columns.empty?),

          (self.cast_sql self.values if self.values),
        ].compact.join ' '
      end
    end
  end
end
