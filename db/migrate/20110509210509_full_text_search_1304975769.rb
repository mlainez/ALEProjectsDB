class FullTextSearch1304975769 < ActiveRecord::Migration
  def self.up
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS projects_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index projects_fts_idx
        ON projects
        USING gin((to_tsvector('english', coalesce(projects.sector, ''))))

      eosql
  end
end
