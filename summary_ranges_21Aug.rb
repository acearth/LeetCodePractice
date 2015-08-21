def summary_ranges(nums)
  return [] if nums.size==0
  return [nums[0].to_s] if nums.size==1
  result=[]
  cur=tail=nums[0]
  nums[1..-1].each do |n|
    if n != tail+1
      result<< cur.to_s if cur==tail
      result<<"#{cur}->#{tail}" if cur!=tail
      cur=tail=n
    else
      tail+=1
    end
  end
  result<< ( nums[-1]==nums[-2]+1 ? "#{cur}->#{nums[-1]}" : nums[-1].to_s )
end
