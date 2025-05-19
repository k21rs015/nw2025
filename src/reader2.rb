path=ARGV[0]
#行頭に行番号を表示
File.open"reader2.rb","r" do |file|
  number = 1
  while line = file.gets&.chomp
     puts number.to_s + ":"+line
     number += 1
  end
end

File.open"sample.txt","r" do |file|
  number = 1
  while line = file.gets&.chomp
     puts "#{number * 2}:#{line}"
     number += 1
  end
end