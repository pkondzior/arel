module Arel
  class Table
    include Arel::Crud

    @engine = nil
    class << self
      attr_accessor :engine
      def cast_sql object
        case(object.class.name)
        when /^Arel::/
          object.to_sql
        when /Fixnum/
          object
        else
          @engine.connection.quote(object)
        end
      end
    end

    attr_reader :name, :engine, :aliases, :table_alias

    def initialize name, engine = Table.engine
      @name    = name
      @engine  = engine
      @engine  = engine[:engine] if Hash === engine
      @columns = nil
      @aliases = []
      @table_alias = nil
    end

    def alias
      Nodes::TableAlias.new("#{name}_2", self).tap do |node|
        @aliases << node
      end
    end

    def tm
      SelectManager.new(@engine).from(self)
    end

    def from table
      SelectManager.new(@engine).from table
    end

    def joins manager
      nil
    end

    def join relation, klass = Nodes::InnerJoin
      return tm unless relation

      sm = SelectManager.new(@engine)
      case relation
      when String, Nodes::SqlLiteral
        raise if relation.blank?
        sm.from Nodes::StringJoin.new(self, relation)
      else
        sm.from klass.new(self, relation, nil)
      end
    end

    def group *columns
      tm.group(*columns)
    end

    def order *expr
      tm.order(*expr)
    end

    def where condition
      tm.where condition
    end

    def project *things
      tm.project(*things)
    end

    def take amount
      tm.take amount
    end

    def having expr
      tm.having expr
    end

    def columns
      @columns ||= @engine.connection.columns(@name, "#{@name} Columns").map do |column|
        Attributes.for(column).new self, column.name.to_sym, column
      end
    end

    def [] name
      name = name.to_sym
      columns.find { |column| column.name == name }
    end

    def to_sql
      @engine.connection.quote_table_name self.name
    end
  end
end
