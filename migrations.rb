require_relative 'db'

ActiveRecord::Migration.create_table :users do |t|
  t.string :username
  t.string :password
end

ActiveRecord::Migrator.up 'nothing'

