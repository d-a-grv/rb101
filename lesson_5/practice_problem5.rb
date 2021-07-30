munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_total_age = 0
munsters.each do |_, bio|
  if bio.value?('male')
    male_total_age += bio['age']
  else
    next
  end
end
p male_total_age