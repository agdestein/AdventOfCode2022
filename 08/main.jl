isvisible(h, i, j) = all(<(h[i, j]), h[i, 1:j-1]) ||
    all(<(h[i, j]), h[i, j+1:end]) ||
    all(<(h[i, j]), h[1:i-1, j]) ||
    all(<(h[i, j]), h[i+1:end, j])

line_score(v) = if length(v) == 1
    0
else
    i = findfirst(≥(v[1]), v[2:end])
    isnothing(i) ? length(v) - 1 : i
end

scenic_score(h, i, j) = 
    line_score(reverse(h[i, 1:j])) *
    line_score(h[i, j:end]) *
    line_score(reverse(h[1:i, j])) *
    line_score(h[i:end, j])

file = "example.txt"
# file = "input.txt"
input = open(readlines, file)
heights = mapreduce(l -> [parse(Int, c) for c ∈ l]', vcat, input)
n = size(heights, 1)

# Part 1
sum(isvisible(heights, i, j) for j = 1:n for i = 1:n)

# Part 2
maximum(scenic_score(heights, i, j) for j = 1:n for i = 1:n)
