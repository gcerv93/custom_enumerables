# frozen_string_literal: true

# modifying enumerable methods
# rubocop: disable Style/For
module Enumerable
  def my_each
    return Enumerator.new(self) unless block_given?

    for ele in self
      yield ele
    end
  end
end
# rubocop: enable Style/For

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }