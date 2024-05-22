class Student 
    attr_reader :name,
                :age,
                :scores
                
      

    def initialize(student_details)
        @name = student_details[:name]
        @age = student_details[:age]
        @scores = []
    end

    def log_scores(score)
        @scores << score
        
    end

    def grade_average
        @scores.sum / @scores.size.to_f
    end
   
end