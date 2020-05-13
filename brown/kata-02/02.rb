require 'test/unit'

class BinaryChopKata < Test::Unit::TestCase
  def binary_search (x, arr, left, right)
    # base case
    if right >= left
      middle_index = left + (right - left)
      middle_value = arr[middle_index]
      if middle_value == x
        middle_index
      # present in the left sub array
      elsif middle_value > x
        binary_search(x, arr, left, middle_index - 1)
      # present in the right sub array
      else
        binary_search(x, arr, middle_index + 1, right)
      end
    else
      -1
    end
  end

  def chop(x, arr)
    binary_search(x, arr, 0, arr.length - 1)
  end

  def chop_iterative(x, arr)
    left = 0
    right = arr.length - 1
    while left <= right do
      middle_index = left + (right - left)
      middle_value = arr[middle_index]
      if middle_value == x
        return middle_index
      # present in the left sub array
      elsif middle_value < x
        left = middle_index + 1
      # present in the right sub array
      else
        right = middle_index - 1
      end
    end
    -1
  end

  # todo play with getting this to work!
  # def chop_pattern_match(x, arr)
  #   left = 0
  #   right = arr.length - 1
  #   while left <= right do
  #     middle_index = left + (right - left)
  #     middle_value = arr[middle_index]
  #     case middle_value
  #       in [x]
  #         return middle_index
  #       in [x] if middle_value < x
  #         left = middle_index + 1
  #       in [x] if middle_value > x
  #         right = middle_index - 1
  #     end
  #   end
  #   -1
  # end

  def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end

  def test_chop_iterative
    assert_equal(-1, chop_iterative(3, []))
    assert_equal(-1, chop_iterative(3, [1]))
    assert_equal(0,  chop_iterative(1, [1]))
    #
    assert_equal(0,  chop_iterative(1, [1, 3, 5]))
    assert_equal(1,  chop_iterative(3, [1, 3, 5]))
    assert_equal(2,  chop_iterative(5, [1, 3, 5]))
    assert_equal(-1, chop_iterative(0, [1, 3, 5]))
    assert_equal(-1, chop_iterative(2, [1, 3, 5]))
    assert_equal(-1, chop_iterative(4, [1, 3, 5]))
    assert_equal(-1, chop_iterative(6, [1, 3, 5]))
    #
    assert_equal(0,  chop_iterative(1, [1, 3, 5, 7]))
    assert_equal(1,  chop_iterative(3, [1, 3, 5, 7]))
    assert_equal(2,  chop_iterative(5, [1, 3, 5, 7]))
    assert_equal(3,  chop_iterative(7, [1, 3, 5, 7]))
    assert_equal(-1, chop_iterative(0, [1, 3, 5, 7]))
    assert_equal(-1, chop_iterative(2, [1, 3, 5, 7]))
    assert_equal(-1, chop_iterative(4, [1, 3, 5, 7]))
    assert_equal(-1, chop_iterative(6, [1, 3, 5, 7]))
    assert_equal(-1, chop_iterative(8, [1, 3, 5, 7]))
  end

  # def test_chop_pattern_match
  #   assert_equal(-1, chop_pattern_match(3, []))
  #   assert_equal(-1, chop_pattern_match(3, [1]))
  #   assert_equal(0,  chop_pattern_match(1, [1]))
  #   #
  #   assert_equal(0,  chop_pattern_match(1, [1, 3, 5]))
  #   assert_equal(1,  chop_pattern_match(3, [1, 3, 5]))
  #   assert_equal(2,  chop_pattern_match(5, [1, 3, 5]))
  #   assert_equal(-1, chop_pattern_match(0, [1, 3, 5]))
  #   assert_equal(-1, chop_pattern_match(2, [1, 3, 5]))
  #   assert_equal(-1, chop_pattern_match(4, [1, 3, 5]))
  #   assert_equal(-1, chop_pattern_match(6, [1, 3, 5]))
  #   #
  #   assert_equal(0,  chop_pattern_match(1, [1, 3, 5, 7]))
  #   assert_equal(1,  chop_pattern_match(3, [1, 3, 5, 7]))
  #   assert_equal(2,  chop_pattern_match(5, [1, 3, 5, 7]))
  #   assert_equal(3,  chop_pattern_match(7, [1, 3, 5, 7]))
  #   assert_equal(-1, chop_pattern_match(0, [1, 3, 5, 7]))
  #   assert_equal(-1, chop_pattern_match(2, [1, 3, 5, 7]))
  #   assert_equal(-1, chop_pattern_match(4, [1, 3, 5, 7]))
  #   assert_equal(-1, chop_pattern_match(6, [1, 3, 5, 7]))
  #   assert_equal(-1, chop_pattern_match(8, [1, 3, 5, 7]))
  # end
end
