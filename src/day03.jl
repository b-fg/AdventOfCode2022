module Day03

using AdventOfCode2022
using DelimitedFiles

abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
       'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
priorities = Dict(letter=>i for (i, letter) ∈ enumerate(abc))

split_rucksack(s) = s[1:Int(length(s)/2)], s[Int(length(s)/2)+1:end]
find_priority(sets) = unique(intersect(sets...))[1]

function day03(input::String=readInput(joinpath(@__DIR__, "..", "data", "day03.txt")))
    rucksacks_part1 = [rucksack for rucksack ∈ split(strip(input), "\n")]
    prios_part1 = [find_priority(split_rucksack(rucksack)) for rucksack ∈ rucksacks_part1]

    rucksacks_part2 = Iterators.partition(rucksacks_part1, 3)
    prios_part2 = [find_priority(rucksacks) for rucksacks ∈ rucksacks_part2]
    return sum(priorities[p] for p ∈ prios_part1), sum(priorities[p] for p ∈ prios_part2)
end

end # module