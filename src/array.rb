a=[10,20,50,30]
#int[] a ={10,20,50,30}

#aの要素をすべて表示
for i in 0..a.length do
  puts a[i]
end

i=0
while i<a.length do
  puts a[i]
  i=i+1
end

for i in a 
  puts i*2
end

a.each do |i|
  puts i+1
end

#aの最初の要素が、偶数だったらaから取り除く
#aのすべての要素を表示
a.shift if a[0] %2 ==0
a.each do |i| puts i end