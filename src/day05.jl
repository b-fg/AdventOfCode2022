module Day05

using AdventOfCode2022

function parse_starting_piles(input)
    piles_all_str = split(strip(input), "\n\n")[1]
    npiles = parse(Int64, piles_all_str[end])
    piles = [Char[] for _ ∈ 1:npiles]
    for level ∈ split(piles_all_str[1:end-1], "\n")
        for (i, crate_str) ∈ enumerate(Iterators.partition(level, 4))
            crate = crate_str[isletter.(crate_str)]
            if isempty(crate) == false
                push!(piles[i], crate[1])
            end
        end
    end
    return reverse.(piles)
end

function parse_movements(input)
    movements_all_str = split(split(strip(input), "\n\n")[2], "\n")
    movements = [parse.(Int64, split(move, " ")[[2, 4, 6]]) for move ∈ movements_all_str]
    return movements
end

answer(piles) = join([pile[end] for pile ∈ piles])

function day05(input::String=readInput(joinpath(@__DIR__, "..", "data", "day05.txt")))
    piles_p1 = parse_starting_piles(input)
    piles_p2 = deepcopy(piles_p1)
    movements = parse_movements(input)
    for (n, from, to) ∈ movements
        # Part 1
        push!(piles_p1[to], reverse(piles_p1[from][end-n+1:end])...)
        deleteat!(piles_p1[from], length(piles_p1[from])-n+1:length(piles_p1[from]))
        # Part 2
        push!(piles_p2[to], piles_p2[from][end-n+1:end]...)
        deleteat!(piles_p2[from], length(piles_p2[from])-n+1:length(piles_p2[from]))
    end
    return answer(piles_p1), answer(piles_p2)
end

end # module