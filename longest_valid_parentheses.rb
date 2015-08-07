#solved but time is wrong.  Need to do it in ONE pass
#
def longest_valid_parentheses(s)
  step=Array.new
  0.upto(s.size-2) { |i| step[i]=2 if s[i..i+1]=="()" }
  max=step.size>0 ? 2:0
  loop do
    changed=false
    i=0
    while i<s.size
      if step[i]!=nil && step[i+step[i]]!=nil
        step[i]+=step[i+step[i]]
        max=step[i] if max<step[i]
        i+=step[i]
        changed=true
      elsif step[i]==nil && step[i+1]!=nil && s[i]=="(" && s[i+step[i+1]+1]==")"
        step[i]=step[i+1]+2
        max=step[i] if max<step[i]
        i-=1 if i>0
        changed=true
      else
        i+=1
      end
    end
    break if !changed
  end
  max
end
