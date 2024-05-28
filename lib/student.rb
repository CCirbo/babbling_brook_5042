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
        # or you could use @scores.push(score)
    end

    def grade_average
        # @scores.sum / @scores.size.to_f

        # could have done this, 
        sum = 0
        @scores.each do |score|
        sum += score
        end
        sum / @scores.length.to_f

    end

 
   
end