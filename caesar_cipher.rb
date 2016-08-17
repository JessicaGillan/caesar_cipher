def shift_char_between(char1,char2,shift_int,char_to_shift)
	shifted_char =  char_to_shift.ord + shift_int
	shifted_char = shifted_char > char2.ord ? ((shifted_char - char2.ord - 1) + char1.ord) : shifted_char
	shifted_char.chr 
end

puts "Enter the string to shift:"
text = gets.chomp
puts "Enter an integer amount to shift by:"
shift = gets.chomp.strip.to_i

shifted_text = text.gsub(/[A-Za-z]/) do |c| 
	if c.ord.between?("A".ord,"Z".ord)
		shift_char_between("A","Z",shift,c)
	else
		shift_char_between("a","z",shift,c)
	end
end

puts shifted_text

