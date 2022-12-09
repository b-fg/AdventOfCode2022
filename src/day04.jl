module Day04

using AdventOfCode2022

parse_range(range_str) = UnitRange(parse.(Int64, split(range_str, "-"))...)

function day04(input::String=readInput(joinpath(@__DIR__, "..", "data", "day04.txt")))
    tasks = [parse_range.([readdlm(IOBuffer(pair), ',', String)...]) for pair ∈ split(strip(input), "\n")]
    return sum(x ⊆ y || x ⊇ y for (x, y) ∈ tasks), sum(isempty(intersect(x, y)) == false for (x, y) ∈ tasks)
end

end # module