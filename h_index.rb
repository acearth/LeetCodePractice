def h_index(arr)
	arr = arr.sort.reverse
	h = 0
	arr.each_with_index do |cite, i|
		cur = i + 1
		h = cur if cite >=  cur
		break if cite < cur
	end
	h
end
