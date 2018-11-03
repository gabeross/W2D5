class Fixnum
  # Fixnum#hash already implemented for you
end


class Array
  def hash
    array_hash = 0
    self.each_with_index do |el, i|
      array_hash += el.ord ^ i
    end
    array_hash
  end
end

class String
  def hash
    string_hash = 19476932
    
    self.each_char.with_index do |el, i|
      string_hash += el.ord ^ i
    end
    string_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_hash = 78479237492
    self.each do |k,v|
      hash_hash += k.hash ^ v.hash
    end
    hash_hash
  end
end
