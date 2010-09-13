module Arel
  module Nodes
    class In < Equality
      def to_sql
        "#{self.cast_sql(self.left)} IN (#{self.right.map { |x| self.cast_sql(x) }.join ', '})"
      end
    end
  end
end
