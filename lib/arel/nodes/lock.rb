module Arel
  module Nodes
    class Lock < Base
      # FIXME: this does nothing on SQLLite3, but should do things on other
      # databases.
      def to_sql
      end
    end
  end
end
