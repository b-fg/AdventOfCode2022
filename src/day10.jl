module Day10

using AdventOfCode2022

function parse_program(program_str)
    program = Tuple{String, Int64}[]
    for instruction ∈ program_str
        op = split(instruction, " ")[1]
        n = length(split(instruction, " ")) > 1 ? parse(Int64, split(instruction, " ")[2]) : 0
        push!(program, (op, n))
    end
    return program
end

print_on_CRT(cycle, X) = mod(cycle, 40) - 1 <= X <= mod(cycle, 40) + 1 ? "#" : "."

function string_product(strings; r="")
    return length(strings) > 1 ? string_product(strings[2:end]; r=r*strings[1]) : r * strings[1]
end

function signal_strength(program)
    cycle, X, strength = 0, 1, Int[]
    CRT = Matrix{String}(undef, 40, 6)
    for (op, n) ∈ program
        if op == "addx"
            CRT[cycle + 1] = print_on_CRT(cycle, X)
            cycle += 1
            push!(strength, cycle * X)
            CRT[cycle + 1] = print_on_CRT(cycle, X)
            cycle += 1
            push!(strength, cycle * X)
            X += n
        else
            CRT[cycle + 1] = print_on_CRT(cycle, X)
            cycle += 1
            push!(strength, cycle * X)
        end
    end
    return strength, [string_product(CRT[:, i]) for i ∈ axes(CRT, 2)]
end

function day10(input::String=readInput(joinpath(@__DIR__, "..", "data", "day10.txt")))
    strength, CRT = parse_program(split(strip(input), "\n")) |> signal_strength
    @out CRT
    return sum(strength[i] for i ∈ 1:length(strength) if mod(i - 20, 40) == 0)
end

end # module