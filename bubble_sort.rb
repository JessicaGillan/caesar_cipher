def bubble_sort(arr)
	swap = true
	while swap
		swap = false
		for i in (0...arr.length - 1) do 
			if arr[i] > arr[i+1] 
				swap = true
				arr[i],arr[i+1] = arr[i+1],arr[i]
			end			
		end
	end
	return arr
end

def bubble_sort_by(arr)
	swap = true
	while swap
		swap = false
		for i in (0...arr.length - 1) do 
			result = yield(arr[i],arr[i+1])
			if result > 0
				swap = true
				arr[i],arr[i+1] = arr[i+1],arr[i]
			end		
		end
	end
	return arr
end

sorted_arr = bubble_sort([4,3,78,2,0,2])
p sorted_arr
# [0,2,2,3,4,78]

sorted_arr2 = bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end
p sorted_arr2
    # => ["hi", "hey", "hello"]