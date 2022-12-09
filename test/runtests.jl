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

@testset "Day 04" begin
    AdventOfCode2022.Day04.day04()
    @test AdventOfCode2022.Day04.day04() == (475, 825)
end

@testset "Day 05" begin
    AdventOfCode2022.Day05.day05()
    @test AdventOfCode2022.Day05.day05() == ("RNZLFZSJH", "CNSFCGJSM")
end