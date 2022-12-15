function findmarker(stream, n)
    l = length(stream)
    for i = 1:l-n+1
        s = stream[i:i+n-1]
        if length(unique(s)) == n
            return i+n-1
        end
    end
end

file = "example.txt"
# file = "input.txt"
stream = open(readline, file)

# Part 1
findmarker(stream, 4)

# Part 2
findmarker(stream, 14)
