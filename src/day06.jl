module Day06

using AdventOfCode2022

function find_unique_n(input, n)
    for i ∈ 1:length(input)-n+1
        if length(Set(input[i:i+n-1])) == n
            return i + n - 1
        end
    end
end

function day06(input::String=readInput(joinpath(@__DIR__, "..", "data", "day06.txt")))
    r1 = find_unique_n(input, 4)
    r2 = find_unique_n(input, 14)
    return r1, r2
end

end # module