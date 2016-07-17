File.open(ARGV[1]).each_with_index { |line,i| puts "#{i}: #{line}" if line.downcase.include?(ARGV[0].downcase) }
