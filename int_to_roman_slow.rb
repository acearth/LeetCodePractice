# Hash in Ruby is ordered by insertion order, currently
TABLE=[[1000...4000,'M'],[900...1000,'CM'],[500...900,'D'], [400...500,'CD'],
       [100...400,'C'],[90...100,'XC'],[50...90,'L'],[40...50,'XL'],
       [10...40,'X'],[9...10,'IX'],[5...9,'V'],[4...5,'IV'],[1...4,'I']].to_h

def int_to_roman(num,cur="")
  TABLE.each{|k,v| return int_to_roman(num-k.begin, cur+v) if k.include? num }
  cur
end
