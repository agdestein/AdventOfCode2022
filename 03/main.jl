priority(c) = if isuppercase(c)
    Int(c) - Int('A') + 27
else
    Int(c) - Int('a') + 1
end

function find_duplicate(group)
    u = unique(join(group))
    j = findfirst(c -> all(l -> c ∈ l, group), u)
    c = u[j]
end

# i = "example.txt"
i = "input.txt"
l = open(readlines, i)

# Part 1
groups = ((l[1:length(l)÷2], l[length(l)÷2+1:end]) for l ∈ l)
sum(priority ∘ find_duplicate, groups)

# Part 2
groups = zip(l[1:3:end], l[2:3:end], l[3:3:end])
sum(priority ∘ find_duplicate, groups)
