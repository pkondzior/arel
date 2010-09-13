module Arel
  module Nodes
    class DeleteStatement < Base
      attr_accessor :relation, :wheres

      def initialize
        @from   = nil
        @wheres = []
      end

      def initialize_copy other
        super
        @wheres = @wheres.clone
      end

      def to_sql
        [
          "DELETE FROM #{self.cast_sql(self.relation)}",
          ("WHERE #{self.wheres.map { |x| self.cast_sql(x) }.join ' AND '}" unless self.wheres.empty?)
        ].compact.join ' '
      end
      
    end
  end
end
