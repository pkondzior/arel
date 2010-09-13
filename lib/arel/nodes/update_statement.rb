module Arel
  module Nodes
    class UpdateStatement < Base
      attr_accessor :relation, :wheres, :values

      def initialize
        @relation = nil
        @wheres   = []
        @values   = []
      end

      def initialize_copy other
        super
        @wheres = @wheres.clone
        @values = @values.clone
      end

      def to_sql
        [
          "UPDATE #{self.cast_sql(self.relation)}",
          ("SET #{self.values.map { |value| self.cast_sql(value) }.join ', '}" unless self.values.empty?),
          ("WHERE #{self.wheres.map { |x| self.cast_sql(x) }.join ' AND '}" unless self.wheres.empty?)
        ].compact.join ' '
      end
    end
  end
end
