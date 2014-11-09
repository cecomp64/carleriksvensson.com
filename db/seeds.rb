# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dump = "db/seeds.sql"
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

