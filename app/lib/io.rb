def output(current, polynomial, n)
  puts "x_#{n} = current, f(x) = #{polynomial}"
end

def get_input
  puts 'Type the polynomial here:'
  return gets.strip
end

