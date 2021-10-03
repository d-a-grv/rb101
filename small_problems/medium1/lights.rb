def toggle!(on, light)
  on.include?(light) ? on.delete(light) : on << light
end


def switch_lights(number_of_lights)
  lights = (1..number_of_lights).to_a
  on = lights.dup

  2.upto(number_of_lights) do |counter|
    lights.each do |light|
      toggle!(on, light) if light % counter == 0
    end
  end

  on.sort
end

p switch_lights(5)
p switch_lights(10)