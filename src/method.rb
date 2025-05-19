def max x, y
    if x>y
        x
    else
        y
    end
    x+y
end

a=5
b=10
c=max(a,b)
puts c

#整数を一つ受け取って
#偶数なら"even"
#奇数なら"odd"
#という文字列を返す
#evenOddというメソッドを宣言
#
#引数5でevaenOddをよびだして、その返り血を表示
#引数10でecenOddを呼び出して、その返り値を表示

def evenOdd x
    if x%2==0
        "even"
    else
        "Odd"
    end  
end

puts evenOdd 5
puts evenOdd 100