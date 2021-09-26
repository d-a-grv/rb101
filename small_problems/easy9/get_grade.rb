GRADES = { A: (90..100),
          B: (80...90),
          C: (70...80),
          D: (60...70),
          F: (0...60)
        }

def get_grade(num1, num2, num3)
  GRADES.each do |grade, range|
    return grade.to_s if range.cover? (num1 + num2 + num3)/3
  end
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"