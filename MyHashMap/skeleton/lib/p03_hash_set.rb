class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end 
    
    arr_idx = key.hash % num_buckets

    unless self.include?(key)
      @store[arr_idx] << key
      @count += 1
    end 
  end

  def include?(key)
    arr_idx = key.hash % num_buckets
    @store[arr_idx].include?(key)
  end

  def remove(key)
    arr_idx = key.hash % num_buckets
    if include?(key)
      @store[arr_idx].delete(key) 
      @count -= 1
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
