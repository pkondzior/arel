module Arel
  module Nodes
    describe 'sql literal' do
      describe 'count' do
        it 'makes a count node' do
          node = SqlLiteral.new('*').count
          node.to_sql.should be_like %{ COUNT(*) }
        end

        it 'makes a distinct node' do
          node = SqlLiteral.new('*').count true
          node.to_sql.should be_like %{ COUNT(DISTINCT *) }
        end
      end
    end
  end
end
