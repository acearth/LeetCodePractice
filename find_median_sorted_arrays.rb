def find_median_sorted_arrays(a,b)
  len=a.size+b.size
  return find_kth(a,b,len/2+1) if len.odd? 
  (find_kth(a,b,len/2)+find_kth(a,b,len/2+1))*0.5
end
## k>0
def find_kth(a,b,k)   
  return find_kth(b,a,k) if a.size<b.size  #ensure a.size >= b.size
  return a[k-1] if b.size==0
  return a[0]>b[0] ? b[0] : a[0] if k==1
  lenb=[b.size,k/2].min
  lena=k-lenb
  return find_kth(a[lena..-1],b,k-lena) if a[lena-1]<b[lenb-1]
  find_kth(a,b[lenb..-1],k-lenb)
end
