loses(c) = if c == 'A'
    'C'
elseif c == 'B'
    'A'
elseif c == 'C'
    'B'
end

wins(c) = if c == 'A'
    'B'
elseif c == 'B'
    'C'
elseif c == 'C'
    'A'
end

outcome(p) = if p.second == wins(p.first)
    6
elseif p.second == p.first
    3
else
    0
end

shape(p) = if p.second == 'A'
    1
elseif p.second == 'B'
    2
elseif p.second == 'C'
    3
end

# i = "example.txt"
i = "input.txt"
m = open(readlines, i)
p = [s[1] => s[3] for s ∈ m]

# Part 1
scores = map(p) do p
    p = p.first => if p.second == 'X'
        'A'
    elseif p.second == 'Y'
        'B'
    elseif p.second == 'Z'
        'C'
    end
    outcome(p) + shape(p)
end
sum(scores)

# Part 2
scores = map(p) do p
    p = p.first => if p.second == 'X'
        loses(p.first)
    elseif p.second == 'Y'
        p.first
    elseif p.second == 'Z'
        wins(p.first)
    end
    outcome(p) + shape(p)
end
sum(scores)
