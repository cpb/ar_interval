class Occurence < ActiveRecord::Base

  scope :occuring, -> (at) { where (arel_table[:start_time] + arel_table[:interval]).lteq(at) }
end
