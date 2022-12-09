module Day01

using AdventOfCode2022

function day01(input::String=readInput(joinpath(@__DIR__, "..", "data", "day01.txt")))
    elf_calories =  [[readdlm(IOBuffer(elf), '\n', Int)...] for elf ∈ split(strip(input), "\n\n")]
    elf_sum_calories = sum.(elf_calories)
    elfs_sorted_by_calories = sortperm(elf_sum_calories, order=Base.Order.Reverse)
    return sum(elf_calories[argmax(elf_sum_calories)]), sum(elf_sum_calories[elfs_sorted_by_calories[1:3]])
end

end # module