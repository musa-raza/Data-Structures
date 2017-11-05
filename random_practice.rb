def print_spiral(array)
  dup = array.dup
  result = []
  while true
    break if dup.length == 0 || dup[0].length == 0

    result.concat(dup.shift)
    break if dup.length == 0 || dup[0].length == 0

    dup.each { |row| result << row.pop }

    break if dup.length == 0 || dup[0].length == 0

    result.concat(dup.pop.reverse)

    break if dup.length == 0 || dup[0].length == 0
  end
  result.each { |val| print val }
end

print_spiral([[1,2,3],[4,5,6],[7,8,9]])
