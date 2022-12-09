using AdventOfCode2022
using Revise, Test

@testset "Day 01" begin
    AdventOfCode2022.Day01.day01()
    @test AdventOfCode2022.Day01.day01() == (69626, 206780)
end

@testset "Day 02" begin
    AdventOfCode2022.Day02.day02()
    @test AdventOfCode2022.Day02.day02() == (11475, 16862)
end

@testset "Day 03" begin
    AdventOfCode2022.Day03.day03()
    @test AdventOfCode2022.Day03.day03() == (7763, 2569)
end