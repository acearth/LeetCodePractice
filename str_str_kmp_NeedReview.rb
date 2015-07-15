# need review matching process
def compute_prefix(patt)
  m=patt.length
  patt="z"+patt
  pi=Array.new
  pi[1]=0
  k=0
  for q in 2..m
    while k>0&&patt[k+1]!=patt[q]
      k=pi[k]
    end
    k+=1 if patt[k+1]==patt[q]
    pi[q]=k
  end
  [0]+pi[1..-1]
end

def kmp_matcher(text, patt)
  n=text.length
  text="z"+text
  m=patt.length ##changed
  pi=compute_prefix(patt)
  q=0
  patt="z"+patt
  for i in 1..n
    while q>0 && patt[q+1]!=text[i]
      q=pi[q]
    end
    q+=1 if patt[q+1]==text[i]
    #print "patten occurs with shift#{i-m}" if q==m
    return i-m if q==m ##changed
    #q=pi[q]
  end
  return -1
end

def str_str(haystack, needle)
  return 0 if needle.size==0
  return 0 if needle.size==1&&haystack[0]==needle[0]
  return -1 if needle.size==1&&haystack[0]!=needle[0]
  return -1 if needle.size>haystack.size
  return kmp_matcher(haystack,needle)
end


