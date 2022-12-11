module Day07

using AdventOfCode2022

const FS_SIZE::Int = 70e6
const UPDATE_SIZE::Int = 30e6

function parse_log(log)
    dir_pointer = String[""]
    fs = Dict("" => 0)

    for cmd ∈ log[2:end]
        if split(cmd, " ")[2] == "cd"
            if split(cmd, " ")[3] == ".."
                pop!(dir_pointer)
            else
                push!(dir_pointer, split(cmd, " ")[3])
                if !(haskey(fs, join(dir_pointer, "/"))) # create directory if not existing
                    fs[join(dir_pointer, "/")] = 0
                end
            end
        elseif tryparse(Int, split(cmd, " ")[1]) !== nothing # is a number (hence a file)
            fsize = parse(Int, split(cmd, " ")[1])
            for i ∈ 1:length(dir_pointer) # sum size to all parent directories
                fs[join(dir_pointer[1:i], "/")] += fsize
            end
        end
    end
    return fs
end

function day07(input::String=readInput(joinpath(@__DIR__, "..", "data", "day07.txt")))
    fs = split(strip(input), "\n") |> parse_log
    return sum(size for (dir, size) ∈ fs if size <= 1e5),
           min([size for (_,size) ∈ fs if size > fs[""] - (FS_SIZE-UPDATE_SIZE)]...)
end

end # module