def file_shuffler(user_input)
  File.open("#{filename}-shuffled", 'w') do |f|
    File.readlines(user_input).shuffle.each do |line|
        f.puts line.chomp
    end
  end
end