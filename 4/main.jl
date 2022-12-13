# i = "example.txt"
i = "input.txt"
l = open(readlines, i)
s = split.(l, ',')

rangepairs = map(s) do s
    map(s) do s
        range(parse.(Int, split(s, '-'))...)
    end
end

## Part 1
sum(rangepairs) do p
    issubset(p[1], p[2]) || issubset(p[2], p[1])
end

## Part 2
sum(rangepairs) do p
    !isempty(p[1] ∩ p[2])
end
