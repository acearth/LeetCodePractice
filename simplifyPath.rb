def simplify_path(path)
  sa=path.split "/"
  sa.delete(".")
  sa.delete("")
  sa.compact!
  dirStack=Array.new
  realPath=String.new
  for elem in sa
    if elem==".."
      dirStack.pop
    else
      dirStack.push elem
    end
  end
  if dirStack.size==0
    return "/"
  else
    for ele in dirStack
      realPath+="/"+ele
    end
  end
  return realPath
end
path = "/a/./b/../../c/"
p simplify_path path
path = "/home/"
p simplify_path path
path = "/../"
p simplify_path path
path="/home//foo/"
p simplify_path path

