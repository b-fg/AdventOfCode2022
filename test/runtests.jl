using AdventOfCode2022
using Revise, Test

@testset "Day 1" begin
    AdventOfCode2022.Day01.day01()
    @test AdventOfCode2022.Day01.day01() == (230, 69626, 206780)
end
