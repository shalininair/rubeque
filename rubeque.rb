
require 'test/unit'
require "test/unit/assertions"
include Test::Unit::Assertions
 
class Rubeque
    
    #If a number is divisible by 3, return "Fizz". 
    #If a number is divisible by 5, return "Buzz". 
    #If a number is divisible by 3 and 5, return "FizzBuzz"
    def fizzbuzz(x)
#      x % 15 == 0 ? "FizzBuzz" : (x % 3 == 0 ? "Fizz" : ( x % 5 == 0 ? "Buzz" : ""))
    "#{'Fizz' if x % 3 == 0}#{'Buzz' if x % 5 == 0}"
    end
    
    # Stop this code from throwing an exception. 
    #Hint: find the right seven-letter array method: http://ruby-doc.org/core-1.9.3/Array.html
    def curious_case
        [1, 4, nil, 9, 16, nil].compact.inject(0) {|sum, number| sum + number}
    end
    # Write a method that takes any number of integers and returns true if they sum to 21, false otherwise. Hint: splat operator.
    def twenty_one?(*numbers)
        numbers.inject(:+) == 21 
    end
    
    #Fill in the missing method. Hint: find the right six-letter enumerable method: http://ruby-doc.org/core-1.9.3/Enumerable.html. 
    #There's also a four-letter alias for the method too.
    def curious_case_mm
      [1, 3, 7, 4, 9, 8].find(&:even?)
   end
   
   # Temperature bot is comfortable when it's room temperature (18-21C). Help him out by completing the method.
   def temperature_bot(temp)
      # temperature bot is American but takes Celsius temperatures
      case temp
      when 18..21
        "I like this temperature"
      else
        "This is uncomfortable for me"
      end
    end
    
    # Write a method using inject and reject that takes an array of integers and gets the sum for all numbers greater than 50
    def sum_over_50(arr)
        arr.reject{|num| num <= 50}.inject(0,&:+)
    end
    
    def no_way
        @name = "Dave"
        "My mind is going #@name"
    end
    
    def versus
        roses = "blue" && "red"
        violets = "blue" and "red"
        "Roses are #{roses} and violets are #{violets}"
    end
    
    def item_removal
        ([:r, :u, :b, :e, :q, :u, :e].reject{|item| item == :r || item == :u || item == :e})  #b,q
        ([:r, :u, :b, :e, :q, :u, :e].select{|item| item == :b || item == :q })  #b,q
        ([:r, :u, :b, :e, :q, :u, :e].replace([:b,:q]))  #b,q
        ([:r, :u, :b, :e, :q, :u, :e]&[:b,:q])  #b,q
    end
end    

class RubequeTest < Test::Unit::TestCase
    
    def test_fizzbuzz
        fb = Rubeque.new
        assert_equal fb.fizzbuzz(3), "Fizz"
        assert_equal fb.fizzbuzz(50), "Buzz"
        assert_equal fb.fizzbuzz(15), "FizzBuzz"
        assert_equal fb.fizzbuzz(5175), "FizzBuzz"
    end
    
    def test_curious_case
        cc = Rubeque.new
        assert_equal cc.curious_case, 30
    end
    
    def test_blackjack
        blackjack = Rubeque.new
        assert_equal blackjack.twenty_one?(3, 4, 5, 6, 3), true
        assert_equal blackjack.twenty_one?(3, 11, 10), false
        assert_equal blackjack.twenty_one?(10, 11), true
        assert_equal blackjack.twenty_one?(10, 10), false        
    end
    
    def test_curious_case_mm
        cc_mm = Rubeque.new
        assert_equal cc_mm.curious_case_mm, 4 
    end
    
    def test_temperature_bot
        tb = Rubeque.new
        assert_equal tb.temperature_bot(18), "I like this temperature"
        assert_equal tb.temperature_bot(21), "I like this temperature"
        assert_equal tb.temperature_bot(22), "This is uncomfortable for me"
        assert_equal tb.temperature_bot(-3), "This is uncomfortable for me"
    end
    
    
    def test_sum_over_50
        so_50 = Rubeque.new
        assert_equal so_50.sum_over_50([29, 52, 77, 102]), 231
        assert_equal so_50.sum_over_50([5, 11, 50]), 0
        assert_equal so_50.sum_over_50([4, 8, 15, 16, 23, 42]), 0
        assert_equal so_50.sum_over_50([300, 22, 1, 55, 42]), 355
    end
    
    def test_no_way
        nw = Rubeque.new
        assert_equal nw.no_way, "My mind is going Dave"
    end
    
    def test_versus
        v = Rubeque.new
        assert_equal v.versus, "Roses are red and violets are blue" 
    end
    
    def test_air
        air = Rubeque.new
        assert_equal air.item_removal, [:b, :q]
    end
    
end
