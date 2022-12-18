module Day11

using AdventOfCode2022

const N_ROUNDS_P1::Int = 20
const N_ROUNDS_P2::Int = 10000

mutable struct Monkey
    items :: Vector{Int}
    op :: Tuple{Function, Union{Nothing, Int}, Union{Nothing, Int}}
    test :: Int
    to :: Tuple{Int, Int}
    inspections :: Int
end

function parse_monkeys(input)
    monkeys = Monkey[]
    lines = findall(x -> contains(x, "Monkey"), input)
    for l ∈ lines
        items = [parse(Int, i) for i ∈ replace.(split(input[l + 1], " "), "," => "")[5:end]]
        op = ops[split(input[l + 2], " ")[end-1]]
        n1, n2 = tryparse.(Int, split(input[l + 2], " ")[[end - 2, end]])
        test = parse(Int, split(input[l + 3], " ")[end])
        to = (parse(Int, split(input[l + 4], " ")[end]) + 1, parse(Int, split(input[l + 5], " ")[end]) + 1) # indexing starts on 1
        push!(monkeys, Monkey(items, (op, n1, n2), test, to, 0))
    end
    return monkeys
end

ops = Dict("+" => +, "-" => -, "*" => *, "/" => /)

function compute(op, n; relief=1)
    n1 = op[2] === nothing ? n : op[2]
    n2 = op[3] === nothing ? n : op[3]
    return op[1](n1, n2) ÷ relief # integer division with ÷
end

throw(to, test, n) = mod(n, test) == 0 ? to[1] : to[2]

function play!(monkeys, rounds; relief=1, common_div=nothing)
    for _ ∈ 1:rounds, monkey ∈ monkeys
        for item ∈ monkey.items
            monkey.inspections += 1
            wl = compute(monkey.op, item; relief=relief)
            send_to = throw(monkey.to, monkey.test, wl)
            push!(monkeys[send_to].items, common_div === nothing ? wl : mod(wl, common_div))
        end
        empty!(monkey.items)
    end
end

function day11(input::String=readInput(joinpath(@__DIR__, "..", "data", "day11.txt")))
    monkeys_p1 = parse_monkeys(split(strip(input), "\n"))
    monkeys_p2 = parse_monkeys(split(strip(input), "\n"))
    common_div = prod([monkey.test for monkey ∈ monkeys_p2])
    play!(monkeys_p1, N_ROUNDS_P1; relief=3)
    play!(monkeys_p2, N_ROUNDS_P2; common_div=common_div)
    sort!(monkeys_p1, by = m -> m.inspections, rev=true)
    sort!(monkeys_p2, by = m -> m.inspections, rev=true)
    return monkeys_p1[1].inspections * monkeys_p1[2].inspections,
        monkeys_p2[1].inspections * monkeys_p2[2].inspections
end

end # module