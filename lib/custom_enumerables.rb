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
end
