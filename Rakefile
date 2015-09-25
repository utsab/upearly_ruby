require 'rake'

namespace :db do
  desc "run migrations"
  task :migrate do
    require_relative 'migrations'
  end

  desc "seed the database"
  task :seed do
    require_relative 'db'

    %w[utsab ben anna].each do |name|
      User.create(username: name, password: ('a'..'z').to_a.sample(6))
    end
  end
end
