def output(n, current)
  puts "x_#{n} = #{current}"
end

def output_final(n, current)
  puts "The #{n - 1}th value was the most precise one, no need to continue - the rest will be zeros, exiting!"
end

def get_input
  puts 'Type the polynomial here:'
  return gets.strip
end
