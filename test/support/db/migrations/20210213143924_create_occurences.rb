class CreateOccurences < ActiveRecord::Migration[5.2]
  def self.up
    create_table :occurences do |t|
      t.datetime :start_time
      t.interval :interval, default: "P7D"
      t.timestamps
    end

    execute "ALTER DATABASE #{connection.current_database} SET IntervalStyle = 'iso_8601'"

  end
end
