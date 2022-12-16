function follow(h, tails)
    for (i, t) ∈ enumerate(tails)
        s = sign.(h .- t)
        a = abs(h[1] - t[1]) 
        b = abs(h[2] - t[2])
        if  a == 2 && b == 2 || a == 2 && b == 2
            t = t .+ s
        elseif  a == 2 && b == 1 || a == 1 && b == 2
            t = t .+ s
        elseif a == 2
            t = t .+ (s[1], 0)
        elseif b == 2
            t = t .+ (0, s[2])
        end
        h = t;
        tails[i] = t;
    end;
    tails;
end

function simulate(dirs, nsteps, h, tails)
    t_hist = [tails[end]]
    for (dir, n) ∈ zip(dirs, nsteps)
        for _ = 1:n
            h = h .+ dir
            tails = follow(h, tails)
            push!(t_hist, tails[end])
        end
    end
    length(unique(t_hist))
end
 
dirmap = Dict(
    "U" => (0, 1),
    "L" => (-1, 0),
    "D" => (0, -1),
    "R" => (1, 0),
)

file = "example.txt"
# file = "example2.txt"
# file = "input.txt"
input = open(readlines, file)
dirs = [dirmap[first(split(l))] for l ∈ input]
nsteps = parse.(Int, last.(split.(input)))

# Part 1
h = (0, 0)
tails = [(0, 0)]
simulate(dirs, nsteps, h, tails)

# Part 2
h = (0, 0)
tails = fill((0, 0), 9)
simulate(dirs, nsteps, h, tails)
