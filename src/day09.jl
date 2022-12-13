module Day09

using AdventOfCode2022, LinearAlgebra

const sqrt2::Float64 = sqrt(2)
const epsF::Float64 = 10 * eps(Float64)
const ROPE_KNOTS_P1::Int = 2
const ROPE_KNOTS_P2::Int = 10

directions = Dict("L"=>[-1, 0], "R"=>[1, 0], "D"=>[0, -1], "U"=>[0, 1])
# if distance H-T < sqrt2 do nothing, else move tail towards head
follow(H, T) = norm(H-T) < sqrt2 + epsF ? T : @. T + sign(H - T)

function tail_positions(moves, rope_length)
    rope = [Int[0, 0] for _ ∈ 1:rope_length]
    tail_log = Set([rope[end]])
    for (direction, steps) ∈ moves
        d = directions[direction]
        for _ ∈ 1:steps
            rope[1] .+= d # move head
            for i ∈ 2:rope_length # move rest of rope
                rope[i] = follow(rope[i-1], rope[i])
            end
            push!(tail_log, rope[end])
        end
    end
    return tail_log
end

function day09(input::String=readInput(joinpath(@__DIR__, "..", "data", "day09.txt")))
    moves = [(split(move, " ")[1], parse(Int, split(move, " ")[2])) for move ∈ split(strip(input), "\n")]
    return tail_positions(moves, ROPE_KNOTS_P1) |> length, tail_positions(moves, ROPE_KNOTS_P2) |> length
end

end # module