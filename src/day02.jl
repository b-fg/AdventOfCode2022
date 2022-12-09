module Day02

using AdventOfCode2022
using DelimitedFiles

abc = ["A", "B", "C"]
xyz = ["X", "Y", "Z"]

shape_to_int(p) = Int(only(p)) - 64
win(i) = mod(i, 3) + 1
lose(i) = i - 1 + 3 * Int(i==1)

function score_part1(C1, C2)
    I1 = shape_to_int(C1)
    I2 = abc[xyz .== C2][1] |> shape_to_int
    if I1 == I2 # draw
        return I2 + 3
    elseif I1 > I2 && abs(I1 - I2) == 1 # lost
        return I2
    elseif I2 > I1 && abs(I1 - I2) == 2 # lost
        return I2
    else # won
        return I2 + 6
    end
end

function score_part2(C1, C2)
    I1 = shape_to_int(C1)
    if C2 == "X" # lose
        return lose(I1)
    elseif C2 == "Z" # win
        return win(I1) + 6
    else # draw
        return I1 + 3
    end
end

function day02(input::String=readInput(joinpath(@__DIR__, "..", "data", "day02.txt")))
    guide = [[readdlm(IOBuffer(play), ' ', String)...] for play ∈ split(strip(input), "\n")]
    return sum([score_part1(play...) for play ∈ guide]), sum([score_part2(play...) for play ∈ guide])
end

end # module