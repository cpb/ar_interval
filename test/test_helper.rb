$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift File.expand_path("support/models", __dir__)

require "ar_interval"

require "active_record"
connection_details = YAML::load(File.open(File.expand_path("support/config/database.yml", __dir__)))
ActiveRecord::Base.establish_connection(connection_details)

require "occurence"

require "minitest/autorun"
