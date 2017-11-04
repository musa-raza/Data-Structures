def is_unique(string)
  seen = Hash.new(0)
  string.each_char do |ch|
    next if ch == " "
    seen[ch] += 1
  end
  seen.values.all? { |num| num == 1 }
end
