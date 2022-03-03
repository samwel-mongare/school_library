require_relative 'person.rb'

class Teacher < Person
    attr_accessor :specialization
    def initialize (age, name = "Unknown", parent_permission = true, specialization)
        super(age, name, parent_permission)
        @specialization = specialization
    end
    def specialization=(specialization)
        @specialization = specialization
    end
    def can_use_services?
        return true
    end
end
