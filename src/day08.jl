module Day08

using AdventOfCode2022

function parse_forest(input)
    forest_rows = split(strip(input), "\n")
    forest = Matrix{Int}(undef, length(forest_rows), length(forest_rows[1]))
    for j ∈ axes(forest, 2), i ∈ axes(forest, 1)
        forest[i, j] = parse(Int, forest_rows[i][j])
    end
    return forest
end

# Part 1
function visible_trees(forest)
    visibles = 0
    for j ∈ 2:size(forest, 2) - 1, i ∈ 2:size(forest, 1) - 1
        if forest[i, j] > maximum(forest[1:i-1, j]) # bottom
            visibles += 1
            continue
        elseif forest[i, j] > maximum(forest[i+1:end, j]) # top
            visibles += 1
            continue
        elseif forest[i, j] > maximum(forest[i, 1:j-1]) # left
            visibles += 1
            continue
        elseif forest[i, j] > maximum(forest[i, j+1:end]) # right
            visibles += 1
            continue
        end
    end
    return visibles + size(forest, 1) * 2 + size(forest, 2) * 2 - 4
end

# Part 2
function directional_score(trees, max_score, height)
    score = findfirst(==(0), trees .< height)
    return score === nothing ? max_score : score
end

function max_scenic_score(forest)
    max_score = 0
    for j ∈ 2:size(forest, 2) - 1, i ∈ 2:size(forest, 1) - 1 # edge trees have 0 scenic score
        bottom_score = directional_score(forest[i-1:-1:1, j], i - 1, forest[i, j])
        top_score = directional_score(forest[i+1:end, j], size(forest, 1) - i, forest[i, j])
        left_score = directional_score(forest[i, j-1:-1:1], j - 1, forest[i, j])
        right_score = directional_score(forest[i, j+1:end], size(forest, 2) - j, forest[i, j])
        max_score = max(max_score, prod([bottom_score, top_score, left_score, right_score]))
    end
    return max_score
end

function day08(input::String=readInput(joinpath(@__DIR__, "..", "data", "day08.txt")))
    forest = parse_forest(input)
    return visible_trees(forest), max_scenic_score(forest)
end

end # module