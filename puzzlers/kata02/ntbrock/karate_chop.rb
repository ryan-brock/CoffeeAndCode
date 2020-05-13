#!/usr/bin/env ruby
# http://codekata.com/kata/kata02-karate-chop/
# https://test-unit.github.io/
require "rubygems"
gem "test-unit"
require "test/unit"
require "test/unit/ui/console/testrunner"

# POSH - Plain Old Semantic HTML

def chop(needle, haystackRaw)
  chop_recurse(needle, haystackRaw.sort, 0, haystackRaw.length-1, 0)
end

def chop_recurse(needle, haystackRaw, start, stop, depth)
  # D-Fence
  if depth > 5 then
    raise "Exceeded Depth"
  elsif start == stop then 
    return start
  elsif haystackRaw == nil || haystackRaw.length <= 0 then
    return -1
  else 
    if ( start == nil ) then
      start = 0
    end
    if ( stop == nil ) then 
      stop = haystackRaw.length-1
    end

    ## Upper level ensures sorted   
    haystack = haystackRaw[start..stop]
    puts "-[ Depth: #{depth} ]--[ Start: #{start}   Stop: #{stop} ]-------------------"
    puts "haystack length: #{haystack.length}  looking for needle: #{needle}   haystack: #{haystack}"
    midpoint = haystack.length / 2
    midpointValue = haystack[midpoint]

    # Value at mid-point
    puts "midpoint #{midpoint} value: #{midpointValue}"  
 
    if midpointValue == needle then
      puts "Exact match at midpoint #{midpoint}  start: #{start}"
      return start + midpoint
    elsif midpointValue > needle then 
      # recurse left
      puts "recurse left #{start} to #{stop - midpoint}"
      chop_recurse(needle, haystack, start, stop - midpoint, depth+1)
    else
      # recurse right 
      puts "recurse right #{start+midpoint} to #{stop}"
      chop_recurse(needle, haystack, start + midpoint, stop, depth+1)
    end 
  end  
end

class MyTest < Test::Unit::TestCase
 def test_chop()
  assert true
  assert_equal(-1, chop(3, []))
#  assert_equal(-1, chop(3, [1]))
  assert_equal(0,  chop(1, [1]))
  #
  assert_equal(0,  chop(1, [1, 3, 5]))
  assert_equal(1,  chop(3, [1, 3, 5]))
  assert_equal(2,  chop(5, [1, 3, 5]))
#  assert_equal(-1, chop(0, [1, 3, 5]))
#  assert_equal(-1, chop(2, [1, 3, 5]))
#  assert_equal(-1, chop(4, [1, 3, 5]))
#  assert_equal(-1, chop(6, [1, 3, 5]))
 #
  assert_equal(0,  chop(1, [1, 3, 5, 7]))
  assert_equal(1,  chop(3, [1, 3, 5, 7]))
  assert_equal(2,  chop(5, [1, 3, 5, 7]))
  assert_equal(3,  chop(7, [1, 3, 5, 7]))
#  assert_equal(-1, chop(0, [1, 3, 5, 7]))
#  assert_equal(-1, chop(2, [1, 3, 5, 7]))
#  assert_equal(-1, chop(4, [1, 3, 5, 7]))
#  assert_equal(-1, chop(6, [1, 3, 5, 7]))
#  assert_equal(-1, chop(8, [1, 3, 5, 7]))
 end
end

# https://stackoverflow.com/questions/6515333/how-do-i-execute-a-single-test-using-ruby-test-unit/6515354
puts "hjiiii ya"
tests = Test::Unit::TestSuite.new("Karate Chop Tests")
tests << MyTest.new('test_chop')#calls myTest#test_chop
Test::Unit::UI::Console::TestRunner.run(tests)

