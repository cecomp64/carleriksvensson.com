
# Common environment variables
db = ENV['db'] ? ENV['db'] : "db/development.sqlite3"
dump = ENV['dump'] ? ENV['dump'] : "db/seed.sql"

desc "Backup an sqlite3 database - spcified with DB env var (#{db} default)" \
  "Fix up the format for postgres based on http://blog.flatironschool.com/post/68064669290/porting-sqlite3-data-to-postgresql-database-in-rails-4"

task 'backup_sqlite3' do 
  filename = "db/backup/sqlite3.#{Time.now.year}_#{Time.now.month}_#{Time.now.day}_#{Time.now.hour}_#{Time.now.min}_#{Time.now.sec}.dump"
  #sh "sqlite3 #{db} .dump > #{filename}"

  sh "sqlite3 #{db} .sch > #{filename}_sch"
  sh "sqlite3 #{db} .dump > #{filename}_dmp"
  sh "grep -v -f #{filename}_sch #{filename}_dmp > #{filename}"
  sh "sed -i '' 's/.*BEGIN TRANSACTION.*//g' #{filename}"
  sh "sed -i '' 's/.*COMMIT.*//g' #{filename}"
  sh "sed -i '' 's/.*schema_migrations.*//g' #{filename}"
  sh "rm -f #{filename}_sch #{filename}_dmp"

  # Fix up some sqlite3 to postgres differences
  sh "sed 's/INTEGER PRIAMARY KEY AUTOINCREMENT/SERIAL PRIMARY KEY/g' #{filename} > #{filename}_pg"
  sh "sed -i '' 's/datetime/timestamp/g' #{filename}_pg"
  sh "sed -i '' 's/varchar(255)/text/g' #{filename}_pg"
  sh "sed -i '' 's/text(255)/text/g' #{filename}_pg"
  sh "sed -i '' 's/.*sqlite_sequence.*//g' #{filename}_pg"
  sh "sed -i '' 's/.*PRAGMA.*//g' #{filename}_pg"
end

desc "Restore from a dump file (default = #{dump}"
task 'restore' => :environment do
  connection = ActiveRecord::Base.connection
  
  # - IMPORTANT: SEED DATA ONLY
  # - DO NOT EXPORT TABLE STRUCTURES
  # - DO NOT EXPORT DATA FROM `schema_migrations`
  sql = File.read(dump)
  statements = sql.split(/;$/)
  statements.pop  # the last empty statement
 
  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute(statement)
    end
  end
end

task 'restore_heroku' => :environment do
  #heroku pg:reset HEROKU_POSTGRESQL_GOLD_URL
  #heroku run rake db:migrate
  #heroku run rake db:seed
end
