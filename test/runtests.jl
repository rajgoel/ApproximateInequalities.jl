using Test
using ApproximateInequalities

@testset "ApproximateInequalities.jl" begin
    
    @testset "Symmetry tests" begin
        @test 0.1 + 0.2 ⪅ 0.3
        @test 0.3 ⪅ 0.1 + 0.2 

        @test 0.1 + 0.2 ⪆ 0.3
        @test 0.3 ⪆ 0.1 + 0.2 

        @test !(0.3 ⪉ 0.1 + 0.2)
        @test !(0.1 + 0.2 ⪉ 0.3)

        @test !(0.1 + 0.2 ⪊ 0.3)
        @test !(0.3 ⪊ 0.1 + 0.2)
    end
end
