# solved using loop
def fibs(num)
  fibonacci = []

  for i in 0...num
    if i == 0
      fibonacci.push(i)
    elsif i == 1
      fibonacci.push(i)
    else
      fibonacci.push(fibonacci[i-1] + fibonacci[i-2])
    end
  end
  fibonacci
end

# solved using iteration
def fibs(num)
  fibonacci = []

  (0...num).each do |num|
    if num == 0
      fibonacci.push(num)
    elsif num == 1
      fibonacci.push(num)
    else
      fibonacci.push(fibonacci[num-1] + fibonacci[num-2])
    end
  end
  fibonacci
end

# solved using recursion

def fibs_rec(num)

  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    fibs_rec(num-1) + fibs_rec(num-2)
  end
end

result = []
(0...8).each {|num| result<<fibs_rec(num)}
p result
