class Person
  attr_writer :age
  def initialize name, age
    @name = name
    @age = age
  end

  def info
    @name + "," + @age.to_s
  end

  #def set_age x
   # @age=x
  #end
end

p=Person.new "toshi",20
puts p.info

#p.set_age 25
p.age=25
puts p.info