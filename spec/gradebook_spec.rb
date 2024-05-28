require './lib/gradebook'
require './lib/course'
require './lib/student'
require 'pry'
require 'rspec'

RSpec.configure do |config|
    config.formatter = :documentation
    end

    RSpec.describe Gradebook do
        before(:each) do
            @gradebook = Gradebook.new("Kat") 
            # @course = Course.new(["Calculus", 2]) 
            # @student = Student.new({name: "Morgan", age: 21}) 
        end

   describe Gradebook do
        it "it should exist"  do
          @gradebook = Gradebook.new("Kat") 
          expect(@gradebook).to be_a(Gradebook)
        end  
    
        it "should have an instructor attribute" do
            expect(@gradebook.instructor).to eq("Kat")
        end   

        it "should start with no courses and add courses using add course" do
            expect(@gradebook.courses).to eq([])

            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("Geometry", 3)

            expect(@gradebook.add_course(course_1)).to eq([course_1])
            expect(@gradebook.courses).to eq([course_1])

            expect(@gradebook.add_course(course_2)).to eq([course_1, course_2])
            expect(@gradebook.courses).to eq([course_1, course_2])
        end
    end
   
    describe "list_all_students" do
        it "should return a hash for list all students with course as key and students as values" do
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("Geometry", 3)

            @student_1 = Student.new({name: "Morgan", age: 21}) 
            @student_2 = Student.new({name: "Fred", age: 22}) 
            @student_3 = Student.new({name: "Jane", age: 23}) 

            course_1.enroll(@student_1)
            course_1.enroll(@student_2)

            course_2.enroll(@student_1)
            course_2.enroll(@student_2)
            course_2.enroll(@student_3)

            @gradebook.add_course(course_1)
            @gradebook.add_course(course_2)

            result_hash = {
                course_1 => [
                    @student_1,
                    @student_2
                ],
                course_2 => [
                    @student_1,
                    @student_2,
                    @student_3
                ]
            }
            expect(@gradebook.list_all_students).to eq(result_hash)
        end
    end  
    
    describe 'students_below_(threshold)' do
        it 'should return a list of students below the thresholds' do
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("Geometry", 3)

            @student_1 = Student.new({name: "Morgan", age: 21}) 
            @student_2 = Student.new({name: "Fred", age: 22}) 
            @student_3 = Student.new({name: "Jane", age: 23}) 

            @student_1.log_scores(95)   #student 1: 100
            @student_2.log_scores(90)
            @student_2.log_scores(80)    #student 2: 85
            @student_3.log_scores(80)    #student 3: 75
            @student_3.log_scores(70)

            course_1.enroll(@student_1)
            course_1.enroll(@student_2)

            course_2.enroll(@student_1)
            course_2.enroll(@student_2)
            course_2.enroll(@student_3)

            @gradebook.add_course(course_1)
            @gradebook.add_course(course_2)
        end
    end
    describe "#students_below(threshold)" do
        it "should return a list of students in any course that have grades velow threshold" do
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("Geometry", 3)

            @student_1 = Student.new({name: "Morgan", age: 21}) 
            @student_2 = Student.new({name: "Fred", age: 22}) 
            @student_3 = Student.new({name: "Jane", age: 23}) 

            @student_1.log_scores(95)   #student 1: 100
            @student_2.log_scores(90)
            @student_2.log_scores(80)    #student 2: 85
            @student_3.log_scores(80)    #student 3: 75
            @student_3.log_scores(70)

            course_1.enroll(@student_1)
            course_1.enroll(@student_2)

            course_2.enroll(@student_1)
            course_2.enroll(@student_2)
            course_2.enroll(@student_3)

            @gradebook.add_course(course_1)
            @gradebook.add_course(course_2)

        #    expect(@gradebook.students_below(80)).to eq([@student_3])
        expect(@gradebook.students_below(90)).to match_array([@student_2, @student_3])
        #    expect(@gradebook.students_below(95)).to eq([@student_1, @student_2, @student_3])

        end
    end
   

    
end






#     3. A gradebook can list all the students in its courses.
# 4. A gradebook can return a list of students whose grades are below a given threshold.

# Method Name                 | Return Value (type)
# -----------                 | -------------------
# `instructor`                | `String`
# `courses`                   | `Array` of `Course` objects
# `add_course(course)`        | `Array` of `Course` objects including the new one just added.
# `list_all_students`         | `Hash` where the `key` is a `Course` object and the `value` is an `Array` of `Student` objects (see example below)
# `students_below(threshold)` | `Array` of `Student` objects

# ```ruby
# # list_all_students

# {
#   <Course> => [<Student>, <Student>],
#   <Course> => [<Student>]
# }
# ```