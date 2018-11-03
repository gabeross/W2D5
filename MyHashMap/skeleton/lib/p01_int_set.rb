class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    out_of_bounds if num > @store.length || num < 0
    @store[num] = true 
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private
  def out_of_bounds
    raise "Out of bounds" 
  end 
  
  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    arr_idx = num % num_buckets
    self[arr_idx] << num
  end

  def remove(num)
    arr_idx = num % num_buckets
    self[arr_idx].delete(num) if include?(num)
  end

  def include?(num)
    arr_idx = num % num_buckets
    self[arr_idx].include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

###################

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end 
    
    arr_idx = num % num_buckets
    unless self.include?(num)
      self[arr_idx] << num 
      @count += 1
    end 
  end

  def remove(num)
    arr_idx = num % num_buckets
    if include?(num)
      self[arr_idx].delete(num) 
      @count -= 1
    end 
  end

  def include?(num)
    arr_idx = num % num_buckets
    self[arr_idx].include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    @count = 0
    elements = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    elements.each do |bucket|
      bucket.each do |el|
        self.insert(el)
      end 
    end 
    @store
  end
end
