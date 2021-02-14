require "active_support/concern"

module ArInterval
  module Validations
    extend ActiveSupport::Concern

    included do
      class_attribute :interval_fields
      self.interval_fields = []
      validate :validate_interval_fields
    end

    class_methods do
      def attribute(name, cast_type = ActiveRecord::Attributes::Type::Value, **options)
        case cast_type when :interval, ArInterval::Type then
          self.interval_fields = [*self.interval_fields, name]
        end

        super
      end
    end

    private def validate_interval_fields
      interval_fields.each do |field|
        field_value = read_attribute_before_type_cast(field)
        begin
          ActiveSupport::Duration.parse(field_value)
        rescue ActiveSupport::Duration::ISO8601Parser::ParsingError => e
          errors.add(field, e.message)
        end
      end
    end
  end
end
