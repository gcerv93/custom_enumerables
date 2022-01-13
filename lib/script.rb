# frozen_string_literal: true

require './custom_enumerables'

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }
