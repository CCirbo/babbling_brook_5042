require './lib/course'
require './lib/student'
require 'pry'
require 'rspec'

RSpec.configure do |config|
    config.formatter = :documentation
    
    end

 RSpec.describe Course do
    before(:each) do
    @course = Course.new("Calculus", 2) 
    end
    it "should exist"  do
    #    @course = Course.new("Calculus", 2) 
       expect(@course).to be_a Course
    end

    it "has attributes for name and capacity" do
        # @course = Course.new("Calculus", 2) 
        expect(@course.name).to eq("Calculus")
        expect(@course.capacity).to eq(2)
    end 
    
    it 'should default the student array to empty' do
        # @course = Course.new("Calculus", 2) 
        expect(@course.students).to eq([])
       
    end

    it 'should return false for full? when course is created' do
        # @course = Course.new("Calculus", 2) 
        expect(@course.full?).to eq(false)
    end

    it 'should enroll students and store them in student array' do
        # @course = Course.new("Calculus", 2) 
        student1 = Student.new({name: "Morgan", age: 21})
        student2 = Student.new({name: "Jordan", age: 29}) 
        @course.enroll(student1)  #when there is no return value we don't
        @course.enroll(student2) #need an expect, we just need this to run method
        expect(@course.students).to eq([student1, student2])

        expect(@course.full?).to eq(true) 
        # Could test this here, in this
        # it block or could set up new test, see below
    end

    it 'should return true or full when course reaches capcicty' do
        student1 = Student.new({name: "Morgan", age: 21})
        student2 = Student.new({name: "Jordan", age: 29}) 

        @course.enroll(student1) 
        expect(@course.full?).to be false

        @course.enroll(student2) 
        expect(@course.full?).to be true
    end
 end   