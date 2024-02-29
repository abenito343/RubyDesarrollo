def max(*nums)

  result = nums.first

  nums.each do |num|
    result= num if num > result
  end

  result
end

def max2(*nums)
  nums.max
end

def longest_string(*strs)
  result = strs.first

  strs.each do |str|
    result = str if str.length > result.length
  end

  result
end


def word_count (str)
  str.split(' ').count
end


def sum(*nums)
  result = 0

  nums.each { |num| result += num }

  result
end

def mean (*nums)
  result= sum(*nums)/nums.count

end


def find_even(*nums)
  #nums.select  { |num| num.even? }

  #nums.select(&:even?)

  #result = []
  #
  #   nums.each do |num|
  #     result << num if num % 2 == 0
  #   end
  #
  #   result

  nums.map {|num| num if num.even? }.compactfind_
end

#puts max(4, 3, 6, 2)


puts "Welcome to test method. Which one you wanna test?"
exercise = gets.chomp

def test1(cases)
  puts cases.all? ? 'Perfect!' : 'Error :S'
end

puts " #{exercise}! ok, let's test it:"

 case exercise
 when 'max'
   test1 [max(3,4,2,1) == 4 , max(100,-5,3,75)== 100]
 when 'max2'
   test1 [max2(3,4,2,1) == 4 , max2(100,-5,3,75)== 100]
 when 'longest_string'
   test1 [longest_string('aaaaaaa', 'aaa')== 'aaaaaaa']
 when 'word_count'
   test1 [word_count('bienvenido a ruby')==3, word_count('ruby')==1]
 when 'sum'
   test1 [sum(1,3,5)==9, sum(0,3,-1,2)==4]
 when 'mean'
 test1 [mean(5,5)==5, mean(2,2,2)==2 ]
 when 'find_even'
   test1 [find_even(1,2,3,4)==[2,4], find_even(1,3,5)==[]]
 else 'no se encontro'
 end
