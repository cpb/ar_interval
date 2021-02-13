class CreateOccurences < ActiveRecord::Migration[5.2]
  def self.up
    create_table :occurences do |t|
      t.datetime :start_time
      t.interval :interval, default: "P7D"
      t.timestamps
    end
  end
end
