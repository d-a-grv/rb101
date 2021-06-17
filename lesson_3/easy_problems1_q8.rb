flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

#1
barney_arr = flintstones.to_a.keep_if do |el|
              el.include?('Barney')
            end

#2
barney_arr = flintstones.assoc('Barney')