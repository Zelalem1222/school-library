require_relative './baseDecorator'


class CapitalizeDecorator < Decorator
    def correct_name
        @nameable_object.correct_name.upcase
    end
end

