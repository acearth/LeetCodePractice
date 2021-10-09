#60ms on 9/oct/2021
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


# New solution 9/oct/2021, 68ms
def find_median_sorted_arrays(nums1, nums2)
    sorted=[]
    while nums1.first && nums2.first
        if nums1.first < nums2.first
            sorted << nums1.shift
        else
            sorted << nums2.shift
        end
    end
    sorted+= nums1 + nums2
    len=sorted.length
    if len.odd?
        sorted[len/2].to_f
    else
        (sorted[len/2]+ sorted[len/2 -1])/2.0
    end
end

# solution on 9/oct/2021, 68ms
def find_median_sorted_arrays(nums1, nums2)
    sorted=[]
    i,j=0,0
    len1, len2 = nums1.length, nums2.length
    while i < len1 && j < len2
        if nums1[i] > nums2[j]
            sorted << nums2[j]
            j+=1
        else
            sorted << nums1[i]
            i+=1
        end
    end
    sorted += nums1[i..len1] + nums2[j..len2]
    newlen=sorted.length
    if newlen.odd?
        sorted[newlen/2]
    else
        (sorted[newlen/2] + sorted[newlen/2 - 1])/2.0
    end
end
