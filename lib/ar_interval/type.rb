module ArInterval
  class Type < ActiveRecord::Type::Value
    def cast(value)
      ActiveSupport::Duration.parse(value)
    end

    def serialize(value)
      value.iso8601
    end

    ActiveRecord::Type.register(:interval, self)
  end
end
