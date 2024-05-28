class Course
    attr_reader :name,
                :capacity,
                :students

     def initialize(name, capacity) 
        @name = name
        @capacity = capacity   
        @students = []
     end  

     def full?
        @students.length >= @capacity
    #     return true
    #    else           This method is doing this, so we don't need the if/els
    #     return false  This is because the if and else return booleans
           #when that happens the method here can just be writtin without the if/els
     end 

    def enroll(student) 
        @students << student
       
    end
end