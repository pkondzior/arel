module Arel
  module Nodes
    class SelectCore < Base
      attr_reader :froms, :projections, :wheres, :groups
      attr_accessor :having

      def initialize
        @froms       = []
        @projections = []
        @wheres      = []
        @groups      = []
        @having      = nil
      end

      def initialize_copy other
        super
        @froms       = @froms.clone
        @projections = @projections.clone
        @wheres      = @wheres.clone
        @group       = @groups.clone
        @having      = @having.clone if @having
      end

      def to_sql
        [
          "SELECT #{self.projections.map { |x| self.cast_sql x }.join ', '}",
          ("FROM #{self.froms.map { |x| self.cast_sql x }.join ', ' }" unless self.froms.empty?),
          ("WHERE #{self.wheres.map { |x| self.cast_sql x }.join ' AND ' }" unless self.wheres.empty?),
          ("GROUP BY #{self.groups.map { |x| self.cast_sql x }.join ', ' }" unless self.groups.empty?),
          (self.cast_sql(self.having) if self.having),
        ].compact.join ' '
      end
    end
  end
end
