def simplify_path(path)
  path=path.split('/').reject { |s| s=="." || s=="" }
  res=[]
  path.each{|s| s==".." ? res.pop : res << s }
  "/"+res.join('/')
end
