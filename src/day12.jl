module Day12

using AdventOfCode2022, Graphs

const abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
heights = Dict(a => i for (i,a) ∈ enumerate(abc))
heights['S'] = heights['a']
heights['E'] = heights['z']
const steps = [CartesianIndex(1, 0), CartesianIndex(-1, 0), CartesianIndex(0, 1), CartesianIndex(0, -1)]

function parse_map(input)
    S, E = Int[0, 0], Int[0, 0]
    height_map = Matrix{Int}(undef, length(input), length(input[1]))
    for j ∈ axes(height_map, 2), i ∈ axes(height_map, 1)
        if input[i][j] == 'S'
            S .= [i, j]
        elseif input[i][j] == 'E'
            E .= [i, j]
        end
        height_map[i, j] = heights[input[i][j]]
    end
    return CartesianIndex(Tuple(S)), CartesianIndex(Tuple(E)), height_map
end

function create_graph(height_map)
    g = Graphs.DiGraph(length(height_map)) # we need a directed graph
    LI = LinearIndices(height_map)
    for I ∈ CartesianIndices(height_map)
        for J ∈ steps
            if any(Tuple(I + J) .> size(height_map)) || prod(Tuple(I + J)) <= 0 # out of bounds
                continue
            elseif height_map[I + J] - height_map[I] > 1 # can't go higher than 1 per step
                continue
            else
                add_edge!(g, LI[I], LI[I + J])
            end
        end
    end
    return g
end

function find_shortest_path_from_a(g, height_map, E)
    Ss = findall(height_map .== 1) # find all 'a' (ie 1) in height map
    paths = [Graphs.a_star(g, LinearIndices(height_map)[S], LinearIndices(height_map)[E]) for S ∈ Ss]
    return minimum(length(p) for p ∈ paths if length(p) > 0)
end

function day12(input::String=readInput(joinpath(@__DIR__, "..", "data", "day12.txt")))
    S, E, height_map = parse_map(split(strip(input), "\n"))
    g = create_graph(height_map)
    shortest_path = Graphs.a_star(g, LinearIndices(height_map)[S], LinearIndices(height_map)[E])
    return length(shortest_path), find_shortest_path_from_a(g, height_map, E)

end

end # module