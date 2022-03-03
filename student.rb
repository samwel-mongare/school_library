require_relative 'person.rb'

class Student < Person
    attr_accessor :classroom
    def initialize (age, name = "Unknown", parent_permission = true, classroom)
        super(age, name, parent_permission)
        @classroom = classroom
    end
    def classroom=(classroom)
        @classroom = classroom
    end
    def play_hooky
        puts "¯\(ツ)/¯"
    end
end
