module Arel
  class TreeManager
    # FIXME: Remove this.
    include Arel::Relation

    def initialize engine
      @engine = engine
    end

    def to_dot
      Visitors::Dot.new.accept @head
    end

    def to_sql
      @head.to_sql
    end

    def initialize_copy other
      super
      @head = @head.clone
    end
  end
end
