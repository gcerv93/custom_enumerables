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

  def my_all?
    my_each do |ele|
      if block_given?
        return false if yield(ele) == false
      elsif ele == false || ele.nil?
        return false
      end
    end
    true
  end

  def my_any?
    my_each do |ele|
      if block_given?
        return true if yield(ele)
      elsif ele
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |ele|
      if block_given?
        return false if yield(ele)
      elsif ele
        return false
      end
    end
    true
  end

  def my_count(ele = nil)
    count = 0
    return length if ele.nil? && !block_given?

    my_each do |item|
      if block_given?
        count += 1 if yield(item)
      elsif item == ele
        count += 1
      end
    end
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    my_each do |ele|
      result << yield(ele)
    end
    result
  end
end
