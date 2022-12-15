# file = "example.txt"
file = "input.txt"
input = open(readlines, file)

dir = input[3:end]
dir

function dirsizes(dir, maxsize)
    istart = findfirst(startswith("\$"), dir)
    isnothing(istart) && (istart = length(dir) + 1)
    ls = dir[1:istart-1]
    s = sum(ls; init = 0) do l
        start = first(split(l))
        if start != "dir"
            parse(Int, start)
        else
            0
        end
    end
    s_small = 0
    rest = dir[istart:end]
    while !isempty(rest)
        if rest[1] == "\$ cd .."
            rest = rest[2:end]
            break
        end
        a, b, rest = dirsizes(rest[3:end], maxsize)
        s += a
        s_small += b
        a < maxsize && (s_small += a)
    end
    return s, s_small, rest
end

s, s_small, rest = dirsizes(dir, 100_000)

# Part 1
s_small

function smallestdeletable(dir, minsize)
    istart = findfirst(startswith("\$"), dir)
    isnothing(istart) && (istart = length(dir) + 1)
    ls = dir[1:istart-1]
    s = sum(ls; init = 0) do l
        start = first(split(l))
        if start != "dir"
            parse(Int, start)
        else
            0
        end
    end
    s_small = typemax(Int)
    rest = dir[istart:end]
    while !isempty(rest)
        if rest[1] == "\$ cd .."
            rest = rest[2:end]
            break
        end
        a, b, rest = smallestdeletable(rest[3:end], minsize)
        s += a
        if a ≥ minsize
            s_small = min(s_small, a, b)
        else
            s_small = min(s_small, b)
        end
    end
    return s, s_small, rest
end

maxsize = 70_000_000
needsize = 30_000_000
freesize = maxsize - s
minsize = needsize - freesize

s, s_small, rest = smallestdeletable(dir, minsize)

# Part 2
s_small
