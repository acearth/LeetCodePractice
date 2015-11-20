# @NOTE: this bsearch() is in find-min mode
def first_bad_version(n)
  (1..n).bsearch{ |i| is_bad_version(i) }
end
