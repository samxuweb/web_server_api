class A
@@a = 'a'
  def initialize(a,b)
    @a = a
    @b = b
  end
  def act
    puts @@a
  end
end
a = A.new(1,true)
a.act
