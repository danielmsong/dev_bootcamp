file =  File.open('./app/words')
file.each_line {|word| Word.create(:word => word.chomp, :anagram => word.downcase.chomp.split("").sort.join)}
