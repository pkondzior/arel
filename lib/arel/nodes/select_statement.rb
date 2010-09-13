module Arel
  module Nodes
    class SelectStatement < Base
      attr_reader :cores
      attr_accessor :limit, :orders, :lock, :offset

      def initialize cores = [SelectCore.new]
        @cores  = cores
        @orders = []
        @limit  = nil
        @lock   = nil
        @offset = nil
      end

      def initialize_copy other
        super
        @cores = @cores.clone
      end

      def to_sql
        [
          self.cores.map { |x| self.cast_sql x }.join,
          ("ORDER BY #{self.orders.map { |x| self.cast_sql x }.join(', ')}" unless self.orders.empty?),
          ("LIMIT #{self.limit}" if self.limit),
          (self.cast_sql(self.offset) if self.offset),
          (self.cast_sql(self.lock) if self.lock),
        ].compact.join ' '
      end
    end
  end
end
