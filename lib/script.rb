# frozen_string_literal: true

require './lib/custom_enumerables'

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }

puts "\n\n"
puts 'my_each_with_index vs. each_with_index'
p numbers.my_each_with_index #{ |item, idx| puts "the index of #{item} is #{idx}" }
p numbers.each_with_index #{ |item, idx| puts "the index of #{item} is #{idx}" }