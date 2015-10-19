def remove_duplicates(arr)
  return arr.size if arr.size<2
  unified=0
  arr[1..-1].each_with_index do |n,i|
    if arr[unified] != n
      unified+=1
      arr[unified]=n
    end
  end
  unified+1
end
