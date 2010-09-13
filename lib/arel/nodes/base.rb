module Arel
  module Nodes
    class Base
      def cast_sql(object)
        Arel::Table.cast_sql(object)
      end
    end
  end
end