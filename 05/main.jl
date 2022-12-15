i = "example.txt"
# i = "input.txt"
input = open(readlines, i)
j = findfirst(==(""), input)
stacklines = input[1:j-1]
instructions = input[j+1:end]

nstack = sum(!=(' '), stacklines[end])
stacks = [filter(!=(' '), [l[2 + 4(k-1)] for l ∈ stacklines[end-1:-1:1]]) for k = 1:nstack]


## Part 1
s = deepcopy(stacks)
for l ∈ instructions
    n, dir = split(l[6:end], " from ")
    a, b = split(dir, " to ")
    n, a, b = parse.(Int, (n, a, b))
    for k = 1:n
        push!(s[b], pop!(s[a]))
    end
end
string([s[end] for s ∈ s]...)

## Part 2
s = deepcopy(stacks)
for l ∈ instructions
    n, dir = split(l[6:end], " from ")
    a, b = split(dir, " to ")
    n, a, b = parse.(Int, (n, a, b))
    na = length(s[a])
    append!(s[b], splice!(s[a], na-n+1:na))
end
string([s[end] for s ∈ s]...)
