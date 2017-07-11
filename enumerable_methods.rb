module Enumerable

  def my_each &block
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index &block
    i = 0
    while i < self.length
      block.call(self[i], i)
      i += 1
    end
    return self
  end

  def my_select &block
    results = []
    self.my_each { |val| results.push(val) if block.call(val)}
    return results
  end

  def my_all? &block
    result = true
    self.my_each { |val| result = false if !block.call(val)}
    return result
  end

  def my_any? &block
    result = false
    self.my_each { |val| result = true if block.call(val)}
    return result
  end

  def my_none? &block
    return !(self.my_any? &block)
  end

  def my_count object = nil, &block
    count = 0
    if block_given?
      self.each do |value|
        count +=1 if block.call(value)
      end
    else
      self.each do |value|
        count +=1 if object == value
      end
    end
    return count
  end

  def my_map process = nil, &block
    process ||= block
    results = []
    self.my_each { |val| results.push(process.call(val))}
    return results
  end

  def my_inject *params, &block
    if block_given?
      memo = params[0]
      self.my_each_with_index do |v, i|
        if i == 0 && !memo
          memo = self[0]
        else
          memo = block.call(memo, v)
        end
      end

    else
      if params[1]
        memo = params[0]
        function = params[1]
        self.my_each {|v| memo = method(function).call(memo, v)}
      else
        function = params[0 ]
        self.my_each_with_index do |v, i|
          if i == 0
            memo = v
          else
            memo = method(function).call(memo, v)
          end
        end
      end
    end
    return memo
  end

end
