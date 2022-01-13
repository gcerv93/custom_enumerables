# frozen_string_literal: true

require './lib/custom_enumerables'

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }
p numbers.my_each
p numbers.each

puts "\n\n"
puts 'my_each_with_index vs. each_with_index'
numbers.my_each_with_index { |item, idx| puts "the index of #{item} is #{idx}" }
numbers.each_with_index { |item, idx| puts "the index of #{item} is #{idx}" }
p numbers.my_each_with_index
p numbers.each_with_index

puts "\n\n"
puts 'my_select vs. select'
p(numbers.my_select { |item| item > 2 })
p(numbers.select { |item| item > 2 })
p numbers.my_select
p numbers.select

puts "\n\n"
puts 'my_all? vs. all?'
numbers = [1, 2, 3, 4,  nil]
p(numbers.my_all? { |n| n.is_a?(Integer) })
p numbers.my_all?
p(numbers.all? { |n| n.is_a?(Integer) })
p numbers.all?

puts "\n\n"
puts 'my_any? vs. any?'
# numbers = [false, false]
p(numbers.my_any? { |n| n.is_a?(String) })
p numbers.my_any?
p(numbers.any? { |n| n.is_a?(String) })
p numbers.any?

puts "\n\n"
puts 'my_none? vs. none?'
numbers = [false, false, nil]
p(numbers.my_none? { |n| n == 5 })
p numbers.my_none?
p(numbers.none? { |n| n == 5 })
p numbers.none?

puts "\n\n"
