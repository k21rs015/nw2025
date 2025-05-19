#
#コマンドラインで指定したすべてのファイルの各行を1行づつ
#ruby rcat.rb a.txt b.txt c.rb
#
ARGV.each do |arg|
  File.open arg,"r" do |file|
    while line = file.gets&.chomp
       puts line
     end
   end  
end

