# May be quickest and shortest solution
def convert_to_title(n)
  return "" if n==0
  cur=n%26
  return convert_to_title(n/26-1)+'Z' if cur==0
  convert_to_title(n/26)+(64 + cur).chr
end
