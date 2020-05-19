#!/usr/bin/ruby


# -----  Requirements  -----
require_relative "karate_chop_ruby"
require "test/unit"


# -----  Method - Unit Test  -----

class TestChop < Test::Unit::TestCase

    
    # ==============================
    # Helper methods
    # ==============================
    def print_label(filename)
        if File.exists?(filename)
            File.open(filename, "r") do |f|
                puts f.read
            end
        end
    end

    
    # ==============================
    # TEST methods
    # ==============================

    def test_example
        print_label("./data/aart_ruby_recursion.txt")
        this_type = nil
        assert_equal(-1, KarateChop.chop(3, [], this_type))
        assert_equal(-1, KarateChop.chop(3, [1], this_type))
        assert_equal(0,  KarateChop.chop(1, [1], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7], this_type))
        assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7], this_type))
    end
    
    def test_sorted_while_loop
        print_label("./data/aart_ruby_while_sorted.txt")
        this_type = "sorted-while-loop"
        assert_equal(-1, KarateChop.chop(3, [], this_type))
        assert_equal(-1, KarateChop.chop(3, [1], this_type))
        assert_equal(0,  KarateChop.chop(1, [1], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7], this_type))
        assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7], this_type))
    end
    
    def test_sorted_recursion
        print_label("./data/aart_ruby_recursion_sorted.txt")
        this_type = "sorted-recursion"
        assert_equal(-1, KarateChop.chop(3, [], this_type))
        assert_equal(-1, KarateChop.chop(3, [1], this_type))
        assert_equal(0,  KarateChop.chop(1, [1], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7], this_type))
        assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7], this_type))
    end
    
    def test_sorted_iteration
        print_label("./data/aart_ruby_iteration_sorted.txt")
        this_type = "sorted-iteration"
        assert_equal(-1, KarateChop.chop(3, [], this_type))
        assert_equal(-1, KarateChop.chop(3, [1], this_type))
        assert_equal(0,  KarateChop.chop(1, [1], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7], this_type))
        assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7], this_type))
    end
    
    def test_unsorted_recursion_2
        print_label("./data/aart_ruby_recursion_2_unsorted.txt")
        this_type = "unsorted-recursion-2"
        assert_equal(-1, KarateChop.chop(3, [], this_type))
        assert_equal(-1, KarateChop.chop(3, [1], this_type))
        assert_equal(0,  KarateChop.chop(1, [1], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5], this_type))
        #
        assert_equal(0,  KarateChop.chop(1, [1, 3, 5, 7], this_type))
        assert_equal(1,  KarateChop.chop(3, [1, 3, 5, 7], this_type))
        assert_equal(2,  KarateChop.chop(5, [1, 3, 5, 7], this_type))
        assert_equal(3,  KarateChop.chop(7, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(0, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(2, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(4, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(6, [1, 3, 5, 7], this_type))
        assert_equal(-1, KarateChop.chop(8, [1, 3, 5, 7], this_type))
    end
    
end
