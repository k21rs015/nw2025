#
# reader.rbの各行を1行づつ画面に表示
file=File.open"reader.rb","r"

while line = file.gets&.chomp
  puts line
end

file.close

#File.open "reader.rb"