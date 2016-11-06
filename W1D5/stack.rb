class Stack
  def initialize
    # create ivar to store stack here!
    @thestack = []
  end

  def add(el)
    # adds an element to the stack
    @thestack << el
  end

  def remove
    # removes one element from the stack
    @thestack.pop
  end

  def show
    # return a copy of the stack
    @thestack.dup
  end
end

class Queue
  def initialize
    @thequeue = []
  end

  def enqueue(el)
    @thequeue << el
  end

  def dequeue
    @thequeue.shift
  end

  def show
    @thequeue.dup
  end
end

class Map
  attr_accessor :themap
  def initialize
    @themap = []
  end

  def assign(key, value)
    already_exists = lookup(key)
    remove(key) if already_exists
    @themap << [key, value]
  end

  def lookup(key)
    @themap.select {|pair| pair[0] == key}.first
  end

  def remove(key)
    @themap.delete(lookup(key))
  end
end

if __FILE__ == $PROGRAM_NAME
  mappy = Map.new
  mappy.assign(:a, 1)
  mappy.assign(:b, 1)
  mappy.assign(:c, 1)
  mappy.assign(:d, 1)
  p mappy.themap
  p mappy.lookup(:d)
  mappy.remove(:b)
  p mappy.themap
  mappy.assign(:a, 3)
  p mappy.themap
end
