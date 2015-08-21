def get_skyline(buildings)
  buildings=buildings.sort_by{|build| build[2]}.reverse
  heights=[0]*buildings.size
  buildings.each {|build| (build[0]).upto(build[1]) {|i| heights[i]=build[2] if build[2]>heights[i]} }
  curHeight=0
  keyPoint=[]
  heights.each_with_index{|height,i| (curHeight=height; keyPoint <<[i,height]) if height!=curHeight }
  keyPoint
end

buildings= [ [2,9,10], [3,7,15], [5,12,12], [15,20,10], [19,24,8] ] 
p get_skyline(buildings)
