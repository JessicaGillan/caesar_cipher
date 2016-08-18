require 'pry'

module Enumerable
	def my_each
		for i in 0...self.length do 
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		for i in 0...self.length do 
			yield(self[i], i)
		end
		self		
	end

	def my_select
		new_arr = []
		self.my_each do |element|
			if yield(element)
				new_arr.push(element)
			end
		end
		new_arr
	end

	def my_all?
		self.my_each do |element|
			unless yield(element)
				return false
			end
		end
		return true 
	end

	def my_any?
		self.my_each do |element|
			if yield(element)
				return true
			end
		end
		return false 
	end

	def my_none?
		self.my_each do |element|
			if yield(element)
				return false
			end
		end
		return true 
	end

	def my_count
		self.length
	end

	def my_map(proc= nil, &block)
		if proc.nil? && block_given?
			proc = block
		end
		arr_map = []
		self.my_each do |element|
			arr_map.push( proc.call(element) )
		end	
		return arr_map	
	end

	def my_inject(memo= nil)
		self.my_each do |element|
			if memo.nil?
				memo = self[0]
				next
			end
			memo = yield(memo, element)
		end
		return memo
	end
end

def multiply_els(arr)
	arr.my_inject do |product, el|
		product * el
	end
end

multiply_els([2,4,5]) #=> 40

binding.pry















