require 'pry'
require './lib/student'
require 'rspec'

RSpec.configure do |config|
    config.formatter = :documentation
    end


RSpec.describe Student do
    before(:each) do
      @student = Student.new({name: "Morgan", age: 21}) 
    end

    it "is an instance of student or it exists"  do
      @student = Student.new({name: "Morgan", age: 21})   #that we can create a student object
      expect(@student).to be_a (Student)
    end  

    it "can populate and read attributes" do
        # @student = Student.new({name: "Morgan", age: 21}) 
        expect(@student.name).to eq("Morgan")
        expect(@student.age).to eq(21)
    end

    it 'default scores attribute to an empty array' do
        # @student = Student.new({name: "Morgan", age: 21}) 
        expect(@student.scores).to eq([])
    end

    it 'should log scores and store them in the score array ' do
        # @student = Student.new({name: "Morgan", age: 21}) 
       @student.log_scores(89) #because I am not checking a return value
       @student.log_scores(78)  #I don't need the expect pry(main)> student.log_score(89)
       expect(@student.scores).to eq([89, 78])
                                                      # pry(main)> student.log_score(78)  
    end

    it 'can average of scores' do
         # @student = Student.new({name: "Morgan", age: 21}) 
        @student.log_scores(89)
        @student.log_scores(78)
        expect(@student.grade_average).to eq(83.5)
    end
    
end
   

