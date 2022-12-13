# i = "example.txt"
i = "input.txt"
s = open(readlines, i)
a = sum.(parse.(Int, s) for s ∈ split.(split(join(s, "\n"), "\n\n"), "\n"))

# Part 1
maximum(a)

# Part 2
sum(sort(a)[end-2:end])
