require_relative 'person.rb'

class Teacher < Person
    attr_accessor :classroom

    def can_use_services?
        return true
    end
end