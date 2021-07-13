ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.delete_if {|_, va| va > 100 }
# p ages.select! {|_, va| va <= 100}
# p ages.keep_if {|_, va| va <= 100}