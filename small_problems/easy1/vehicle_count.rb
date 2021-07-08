def count_occurrences(arr)
  occurrences = Hash.new
  arr.each do |obj|
    if occurrences.key?(obj)
      occurrences[obj] += 1
    else
      occurrences[obj] = 1
    end
  end
  occurrences.each {|k, v| puts "#{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

#option_2
def count_occurrences1(vehicles)
  vehicles.tally.each { |k, v| puts "#{k} => #{v}" }
end

#option_3
def count_occurances(ary)
  counts = Hash.new(0)
  ary.each {|e| counts[e] += 1}
  counts.each {|k, v| puts "#{k} => #{v}"}
end