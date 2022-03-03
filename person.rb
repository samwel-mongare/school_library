class Person
    def initialize(age, name = "Unknown", parent_permission = true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    def name
        @name
    end
    def age 
        @age
    end
    def parent_permission
        @parent_permission
    end
    def name=(name)
        @name = name
    end
    def name=(name)
        @age = age
    end

    def can_use_services?
        if is_of_age? or parent_permission
            return true            
        else
            return false
        end
    end

    private

    def is_of_age?
        if age.to_i >= 18
            return true
        else
            return false
        end
    end
end