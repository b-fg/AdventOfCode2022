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

@testset "Day 06" begin
    AdventOfCode2022.Day06.day06()
    @test AdventOfCode2022.Day06.day06() == (1287, 3716)
end

@testset "Day 07" begin
    AdventOfCode2022.Day07.day07()
    @test AdventOfCode2022.Day07.day07() == (1908462, 3979145)
end

@testset "Day 08" begin
    AdventOfCode2022.Day08.day08()
    @test AdventOfCode2022.Day08.day08() == (1736, 268800)
end

@testset "Day 09" begin
    AdventOfCode2022.Day09.day09()
    @test AdventOfCode2022.Day09.day09() == (6486, 2678)
end

@testset "Day 10" begin
    AdventOfCode2022.Day10.day10()
    @test AdventOfCode2022.Day10.day10() == (13820, ["####.#..#..##..###..#..#..##..###..#..#.", "...#.#.#..#..#.#..#.#.#..#..#.#..#.#.#..", "..#..##...#....#..#.##...#....#..#.##...", ".#...#.#..#.##.###..#.#..#.##.###..#.#..", "#....#.#..#..#.#.#..#.#..#..#.#.#..#.#..", "####.#..#..###.#..#.#..#..###.#..#.#..#."])
end

@testset "Day 11" begin
    AdventOfCode2022.Day11.day11()
    @test AdventOfCode2022.Day11.day11() == (58056, 15048718170)
end