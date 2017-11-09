require 'byebug'

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

    dup.reverse.each { |row| result << row.shift }

    break if dup.length == 0 || dup[0].length == 0

  end
  result.each { |val| print val }
end


def colorful(number)
  split_array = number.to_s.chars.map(&:to_i)
  substrings_num = []
  (0...split_array.length).each do |i|
    (i..split_array.length).each do |j|
      array = split_array[i..j]
      substrings_num << array
    end
  end
  substrings_num = substrings_num.uniq
  prod_to_check = substrings_num[0].reduce(:*)
  substrings_num.none? { |array| array.reduce(:*) == prod_to_check }
end


def look_say(num)
  str_num = num.to_s
  result = [str_num]
  counter = 1
  while result.length < 11
    last_num = result[-1]
    temp = ""
    last_num.chars.each_with_index do |ch, idx|
      next_ch = last_num[idx+1]
      if ch != next_ch || idx == last_num.length - 1
        temp += counter.to_s
        temp += ch
        counter = 0
      end
      counter += 1
    end
    result << temp
  end
  result[1..-1]
end


def string_eval(string)
  operator_stack = []
  num_stack = []
  operators = ["*", "+", "-"]
  chars = string.chars
  end_idx = string.length - 1
  until end_idx < 0
    if operators.include?(chars[end_idx])
      operator_stack << chars[end_idx]
    else
      num_stack << chars[end_idx]
    end
    end_idx -= 1
  end

  while num_stack.length > 1
    num = num_stack.pop.to_i
    operator = operator_stack.pop
    second_num = num_stack.pop.to_i
    if operator == "*"
      num_stack.push((num * second_num).to_s)
    elsif operator == "-"
      num_stack.push((num - second_num).to_s)
    else
      num_stack.push((num + second_num).to_s)
    end
  end
  return num_stack[0].to_i
end

def reverse_linked_list(head)
  next_node = nil
  prev_node = nil
  current_node = head
  until current_node == nil
    next_node = current_node.next
    current_node.next = prev_node
    prev_node = current_node
    current_node = next_node
  end
  head = prev_node
end


def seed_nums(number)
  return nil if number < 10
  # result = []
  factors = (1..number/2).select { |num| number % num == 0 }
  factors.map do |num|
    digits = num.to_s.chars.map(&:to_i)
    if digits.reduce(:*) * num == number
      num
    end
  end.compact
end

def kth_to_last(head, k)
  slow = head
  fast = head
  k.times do |i|
    fast = fast.next
  end

  while fast.val != nil
    fast = fast.next
    slow = slow.next
  end

  return slow
end

def delete_node(node)
  node.val = node.next.val;
  node.next = node.next.next;
end

class StackQueue

  def initialize
    @in = []
    @out = []
  end

  def enqueue(val)
    @in << val
  end

  def dequeue

    if @out.empty?
      @out << @in.pop until @in.empty?
    end

    @out.pop
  end

end

class MaxStack

  def initialize
    @store = []
  end

  def push(value)
    if @store.empty?
      @store << { val: value, max: value}
    else
      @store << { val: value, max: [@store[-1][:max], value].max }
    end
  end

  def pop
    @store.pop[:val]
  end

  def max
    @store.empty? ? nil : @store[-1][:max]
  end
end

def is_valid(string)
  left_matchers = ["[", "(", "{" ]
  right_matchers = ["]", ")", "}"]
  stack = []
  string.chars.each do |ch|
    if left_matchers.include?(ch)
      stack << ch
    elsif right_matchers.include?(ch)
      val_popped = stack.pop
      return false if left_matchers.index(val_popped) != right_matchers.index(ch)
    end
  end
  return stack.length == 0
end
#
#
# 1. How to find nth element from the end in a linked list.
# 2. Implement queue using stacks.
# 3. Remove an element from a linked list when we know only the pointer to it.
