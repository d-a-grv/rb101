def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  
  return :invalid if sides.sort.take(2).sum <= sides.max

  case sides.uniq.length
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid


def tri_angle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid unless angles.sum == 180 && angles.all? {|angle| angle > 0}

  if angles.all? { |angle| angle < 90 }
    :acute
  elsif angles.any? { |angle| angle > 90 }
    :obtuse
  else
    :right
  end
end

p tri_angle(60, 70, 50) == :acute
p tri_angle(30, 90, 60) == :right
p tri_angle(120, 50, 10) == :obtuse
p tri_angle(0, 90, 90) == :invalid
p tri_angle(50, 50, 50) == :invalid