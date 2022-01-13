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
