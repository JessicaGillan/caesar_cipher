def substrings(string_to_search, substrings)
	matches = Hash.new(0)

	substrings.each do |substring|
			result = string_to_search.scan(/#{substring}/i) 
			matches[substring] = result.count
	end

	matches.delete_if{ |_,v| v == 0 }
	p matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)