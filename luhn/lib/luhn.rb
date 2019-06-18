module Luhn
  def self.is_valid?(number)
    # double every other number
    numbers = number.digits.each_with_index.map do |n, i|
      (i % 2 != 0) ? n * 2 : n
    end

    # subtract 9 from any over or equal to 10
    numbers = numbers.map { |n| (n >= 10) ? n - 9 : n }

    # determine if digits sum is divisible by 10
    return (numbers.sum % 10 == 0) ? true : false

  end
end
