# frozen_string_literal: true

# modifying enumerable methods
module Enumerable
  # rubocop: disable Style/For
  def my_each
    return to_enum unless block_given?

    for ele in self
      yield ele
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    idx = 0
    for ele in self
      yield ele, idx
      idx += 1
    end
  end
  # rubocop: enable Style/For

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |ele|
      result << ele if yield(ele) == true
    end
    result
  end

  def my_all?(pattern = nil)
    my_each do |ele|
      if !pattern.nil?
        return false unless pattern === ele
      elsif block_given?
        return false if yield(ele) == false
      elsif ele == false || ele.nil?
        return false
      end
    end
    true
  end

  def my_any?(pattern = nil)
    my_each do |ele|
      if !pattern.nil?
        return true if pattern === ele
      elsif block_given?
        return true if yield(ele)
      elsif ele
        return true
      end
    end
    false
  end

  def my_none?(pattern = nil)
    my_each do |ele|
      if !pattern.nil?
        return false if pattern === ele
      elsif block_given?
        return false if yield(ele)
      elsif ele
        return false
      end
    end
    true
  end

  def my_count(item = nil)
    count = 0
    return length if item.nil? && !block_given?

    my_each do |ele|
      if block_given?
        count += 1 if yield(ele)
      elsif ele == item
        count += 1
      end
    end
    count
  end

  def my_map(&my_proc)
    result = []
    my_each do |ele|
      res = if block_given?
              yield(ele)
            else
              my_proc.call(ele)
            end
      result << res
    end
    result
  end

  def my_inject(initial = nil)
    my_each_with_index do |ele, idx|
      if initial.nil? && idx.zero?
        initial = ele
        next
      end
      initial = yield(initial, ele) if block_given?
    end
    initial
  end
end
