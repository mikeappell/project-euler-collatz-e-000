def even_next(n)
  n / 2
end

def odd_next(n)
  (3 * n) + 1
end

def next_value(n)
  n.even? ? even_next(n) : odd_next(n)
end

def collatz(n)
  sequence = [n]
  until n == 1 do
    n = next_value(n)
    sequence << n
  end
  sequence
end

def longest_collatz
  ## Array assignment just slows the program down and is unnecessary for this problem, so I'm skipping the 'collatz' method ##
  longest = {number: nil, length: 0}
  (1..1000000).each do |collatz|
    length, maybe_longest = 0, collatz
    until maybe_longest == 1 do
      maybe_longest = maybe_longest.even? ? even_next(maybe_longest) : odd_next(maybe_longest)
      length += 1
    end
    longest = {number: collatz, length: length} if length > longest[:length]
  end
  longest[:number]
end

