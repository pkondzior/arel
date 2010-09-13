module Arel
  module Compatibility # :nodoc:
    class Wheres # :nodoc:
      include Enumerable

      module Value # :nodoc:
        def value
          Arel::Table.cast_sql(self)
        end

        def name
          super.to_sym
        end
      end

      def initialize engine, collection
        @engine     = engine
        @collection = collection
      end

      def each
        @collection.each { |c|
          c.extend(Value)
          yield c
        }
      end
    end
  end
end
