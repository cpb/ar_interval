class Occurence < ActiveRecord::Base
  include ArInterval::Validations

  attribute :interval, :interval

  scope :occuring, -> (at) { where (arel_table[:start_time] + arel_table[:interval]).lteq(at) }

  def occuring?(at)
    (start_time + interval) <= at
  end
end
