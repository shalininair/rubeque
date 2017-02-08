
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
        # All solutions work
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
    
    def test_or_equal
        b = 8
        c = false
        
        a ||= "rubeque"
        b ||= "rubeque"
        c ||= "rubeque"
        
         assert_equal a, "rubeque"
         assert_equal b, 8
         assert_equal c, "rubeque"
    end
    
    
    def test_no_way_string
        str = "Hello" "World"
        assert_equal str, "HelloWorld"
    end
    
    def test_range
        assert_equal (1..100).to_a[11..94].reduce(:+), 4494
    end
    
    def test_sugar
        assert_equal 2.method(:+).call(2), 2 + 2
        assert_equal 40.method(:+).call(2), 42
    end
    
    def test_brackets
        assert_equal "hello world"["e"], "e"
        assert_equal "what"["e"],        nil
        assert_equal "rubeque" ["e"],     "e"
        assert_equal "E"["e"],           nil
    end
    
    def test_set_intersection
        assert_equal ([ 1, 1, 3, 5 ] & [ 1, 2, 3 ]), [ 1, 3 ]
    end
    
    def test_alternate_notations
        assert_equal %w(hello world), ["hello", "world"]
        assert_equal %w{1 2 3 4}, ["1", "2", "3", "4"]
        assert_equal %w?remembrance of things past?, ["remembrance", "of", "things", "past"]
    end
    
    module Getters_and_setters
        class Character
          attr_accessor :name, :quote
        end
    end
    
    def test_getters_and_setters
        thorin = Getters_and_setters::Character.new
        thorin.name = "Thorin Oakenshield"
        thorin.quote = "Some courage and some wisdom, blended in measure. If more of us valued food 
          and cheer and song above hoarded gold, it would be a merrier world"
          
        stephen = Getters_and_setters::Character.new
        stephen.name = "Stephen Dedalus"
          
        assert_equal thorin.name, "Thorin Oakenshield" 
        assert_equal stephen.name, "Stephen Dedalus"
    end    
    
    
    def test_caution_case
        def caution_case(obj)
          case obj
          when obj
            true
          else
            false
          end
        end
        
        assert_equal caution_case( 1 ), true
        assert_equal caution_case( [1, 2] ), true
        assert_equal caution_case( {1=>2} ), true
        assert_equal caution_case( (1..2) ), false
        # this is because case when uses the === operator for comparison and translates the code to when obj (from the when statement) === obj (from the case statement)
        # range === obj returns true if obj is an element of the range and false if otherwise 
        # In this case since the obj (from the case statement) is a range and not an element of the range, it returns false
    
        
    end
    
    def test_ternary
        a = "Miles O'Brien"
        b = "Barack Obama"
        
        assert_equal ((a =~ /[ ]\w'/) ? "Irish" : "Not Irish"), "Irish"
        assert_equal ((b =~ /[ ]\w'/) ? 'Irish' : 'Not Irish'), "Not Irish"        
    end
    
    module Queue_Continuum
        class Queue
           
           def initialize(arr)
              @q = arr
           end
           
           def pop(*pop_count)
              @q.shift(*pop_count)
           end
           def push(arr)
               @q.push(*arr) ? true : false
           end
           def to_a
               @q
           end
        end
        
    end
    
    def test_queue_continuum
        queue = Queue_Continuum::Queue.new([5, 6, 7, 8])
        #p queue.inspect
        
         assert_equal queue.pop, 5
         assert_equal queue.pop, 6
         assert_equal queue.push([4, 2]), true
         assert_equal queue.pop(2), [7, 8]
         assert_equal queue.to_a, [4, 2]
    end
    
    def test_missing_method_3
        a1 = [1, 2, 3]
        a2 = [2, 3, 4]
        b1 = ["durham", "bartow", "zwolle"]
        b2 = ["nc", "fl", "nl"]
        
        assert_equal a1.zip(a2), [[1, 2], [2, 3], [3, 4]]
        assert_equal [10, 11, 12].zip(a1, a2), [[10, 1, 2], [11, 2, 3], [12, 3, 4]]
        assert_equal b1.zip(b2), [["durham", "nc"], ["bartow", "fl"], ["zwolle", "nl"]]        
    end
    
    def test_defined
        
        if false
          w = :whatever
        end
        
        assert_equal defined?(w) != nil, true        
    end
   
   def test_probability
       
        random_values = (0..1000000).inject(0.0) do |sum, _| 
          sum += rand(14) + rand(14)
        end
        assert_equal (random_values/1000000.0).round, 13
        # The formula is sum of all( seeds - 1) / 2
        #e.g. in the above code if we use sum += rand(14) + rand(16) + rand(18) + rand(20), 
        # random_values/1000000.0).round will be (13+15+17+19)/2 = 32
   end
   
   def test_no_limit
        assert_equal ["1", "2", "3"], "1,2,3".split(',',-1)
        assert_equal ["", "", "1", "2", "3"], ",,1,2,3".split(',',-1)
        assert_equal ["1", "2", "3", "", ""], "1,2,3,,".split(',',-1)       
   end
   
   module Stacks
   #  Implement a last-in-first-out datatype
        class Stack
            
            def initialize(input_array)
             @object = input_array    
            end
          
            def pop(*pop_count)
              pop_count == [] ? @object.pop(*pop_count) : @object.pop(*pop_count).reverse
            end
            
            def push(arr)
                true if @object.push(*arr)
            end
            
            def to_a
                @object
            end
            
            
        end
    end    
    
    def test_stack

        stack = Stacks::Stack.new([5, 6, 7, 8])
        assert_equal stack.pop, 8
        assert_equal stack.pop, 7
        assert_equal stack.push([4, 2]), true
        assert_equal stack.pop(3), [2, 4, 6]
        assert_equal stack.to_a, [5]
    end    
    
    module Missing_Method4
        class A
        end
        
        class B < A
        end
    end
    
    def test_missing_method_4
        assert_equal Missing_Method4::B.ancestors[1], Missing_Method4::A        
    end
    
    def test_missing_method_5
   #  Implementing associative arrays to store ordered maps        
        trilogy = [["Sympathy for Mr Vengeance", "Ryu", "Cha Yeong-mi"], ["Oldboy", "Oh Dae-su", "Kang Hye-jeong"], 
          ["Sympathy for Lady Vengeance", "Lee Geum-ja"]]
          
        assert_equal trilogy.assoc("Sympathy for Lady Vengeance"), ["Sympathy for Lady Vengeance", "Lee Geum-ja"]
        assert_equal trilogy.rassoc("Ryu"), ["Sympathy for Mr Vengeance", "Ryu", "Cha Yeong-mi"]
        assert_equal trilogy.rassoc("Lee Geum-ja"), ["Sympathy for Lady Vengeance", "Lee Geum-ja"]
        
    end
    
    def test_default_encoding
        assert_equal "".encoding, Encoding::UTF_8
        assert_equal "ascii compatible string".encoding, Encoding::UTF_8
    end
    
    def test_curry
    #Create a partial function based on an existing lambda by using currying    
    #refer https://www.sitepoint.com/functional-programming-techniques-with-ruby-part-ii/ for curry 
        exponential = -> x, y { y ** x }
        squared = exponential.curry[2]
        
        assert_equal squared.(3) == 9, true        
    end

end
