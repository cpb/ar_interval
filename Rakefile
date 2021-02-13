require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => ['db:drop','db:create','db:migrate', :test]

require 'pg'
require 'active_record'
require 'yaml'

file 'test/support/config/database.yml' do |task,**kargs|
  FileUtils.cp(task.name + '.example',task.name)
end

$:.unshift('./test/support/models')
task :console => :database_connection do
  require 'pry'
  require 'occurence'

  binding.pry
end

desc "Establish Database Connection"
task :database_connection => 'test/support/config/database.yml' do
  connection_details = YAML::load(File.open('test/support/config/database.yml'))
  ActiveRecord::Base.establish_connection(connection_details)
end

namespace :db do

  task :admin_connection => 'test/support/config/database.yml' do
    connection_details = YAML::load(File.open('test/support/config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details.merge({
      'database'=> 'postgres',
      'schema_search_path'=> 'public'
    }))
  end

  desc "Migrate the db"
  task :migrate => :database_connection do
    ActiveRecord::Migrator.migrations_paths = "test/support/db/migrations"
    ActiveRecord::Tasks::DatabaseTasks.migrate
  end

  desc "Create the db"
  task :create => ['test/support/config/database.yml', :admin_connection] do
    connection_details = YAML::load(File.open('test/support/config/database.yml'))
    ActiveRecord::Base.connection.create_database(connection_details.fetch('database'))
  end

  desc "drop the db"
  task :drop => ['test/support/config/database.yml', :admin_connection] do
    connection_details = YAML::load(File.open('test/support/config/database.yml'))
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../test/support/db/migrations/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<~EOF
        class #{migration_class} < ActiveRecord::Migration[5.2]
          def self.up
          end
          def self.down
          end
        end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
