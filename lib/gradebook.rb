class Gradebook         

    attr_reader :instructor,
                :courses
  

    def initialize(instructor) 
        @instructor = instructor
        @courses = []
       
    end

    def add_course(course)
        @courses << course
    end

    def list_all_students
       student_hash = {}
        @courses.each do |course|
        # student_hash[course] = course.students  this line works or
       student_hash.store(course, course.students)
        end
       student_hash
    end
# could also do this one, used in JavaScript often
    # @courses.reduce({}) do |student_hash, course|
    # student_hash|course| = course.students
    # student_hash
    # end

    def students_below(threshold)
       #courses -> [<Course>]
       #------> @students ---->[<Students>]
        @courses.map do |course|
          
          course.students.find_all { |student| student.grade_average  <= threshold }
        end.flatten.uniq
    end
    
        #nesting iteration. iterating through student objects
        #we get back an array of an array but we only want a single array
        #we did two differnt pieces of iteration, first we are doing finding
        #each individual course and going through the student objects and finding the students that
        # are below the threshold and then we are populating an array through the map so that we
        #instead of the an array of course objects we are now creating an array of student objects
       #starts as an array of course objects and ends up an array of student objects. uniq allows us to 
       #  remove any duplication. also look up flat_map

    
end

