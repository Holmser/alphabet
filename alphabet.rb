#! /usr/bin/env ruby
# Super quick and dirty, don't judge me



class Alphabet
  @map = Hash.new
  ("a".."z").each_with_index do |letter, number|
    @map.merge!(letter => number + 1)
  end
  def self.calculate(word)
    chars = word.split('')
    total = 0
    letters = " "
    numbers = ""
    chars.each do |c|
      letters += "#{c}  "
      numbers += "#{sprintf '%02d', @map[c.downcase].to_i} "
      total += @map[c.downcase].to_i
    end
    {total => letters + "\n" + numbers + "= #{total}"}
  end

  File.open("dict_lowercase.txt") do |f|
    counter = 0
    f.each_line do |line|
      total = calculate(line.chomp)
      if total[100]
        counter += 1
        puts total[100]
        puts ""
      end
    end
  end
end
