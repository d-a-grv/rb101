def bubble_sort!(arr)
  false_arr = []
  
  until false_arr.length == arr.length
    bool_result = false
    false_arr = [bool_result]
    index1 = 0

    1.upto(arr.length-1) do |index2|
      bool_result = arr[index1] > arr[index2] ? true : false
      if bool_result
        arr[index1], arr[index2] = arr[index2], arr[index1]
      else
        false_arr << bool_result
      end
      index1 += 1
    end
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)