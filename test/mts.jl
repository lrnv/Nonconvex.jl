# using Nonconvex, LinearAlgebra, Test, Zygote, FiniteDifferences
# const FDM = FiniteDifferences
using Nonconvex, Test

f(x::AbstractVector) = sqrt(x[2])
g(x::AbstractVector, a, b) = (a*x[1] + b)^3 - x[2]

@testset "LS1" begin
    println("Testing LS1...")
    LS1_options = MTSOptions(
        method = localsearch1
    )
    m = Model(f)
    addvar!(m, [0.0, 0.0], [10.0, 10.0])
    alg = MTSAlg()
    r = Nonconvex.optimize(m, alg, options = LS1_options)
    @test abs(r.minimum - sqrt(8/27)) < 1e-6
    @test norm(r.minimizer - [1/3, 8/27]) < 1e-6
end

@testset "LS2" begin
    println("Testing LS2...")
    LS2_options = MTSOptions(
        method = localsearch2
    )
    m = Model(f)
    addvar!(m, [0.0, 0.0], [10.0, 10.0])
    alg = MTSAlg()
    r = Nonconvex.optimize(m, alg, options = LS2_options)
    @test abs(r.minimum - sqrt(8/27)) < 1e-6
    @test norm(r.minimizer - [1/3, 8/27]) < 1e-6
end

@testset "LS3" begin
    println("Testing LS3...")
    LS3_options = MTSOptions(
        method = localsearch3
    )
    m = Model(f)
    addvar!(m, [0.0, 0.0], [10.0, 10.0])
    alg = MTSAlg()
    r = Nonconvex.optimize(m, alg, options = LS3_options)
    @test abs(r.minimum - sqrt(8/27)) < 1e-6
    @test norm(r.minimizer - [1/3, 8/27]) < 1e-6
end

@testset "entire MTS" begin
    println("Testing MTS...")
    MTS_options = MTSOptions(
        method = MTS
    )
    m = Model(f)
    addvar!(m, [0.0, 0.0], [10.0, 10.0])
    alg = MTSAlg()
    r = Nonconvex.optimize(m, alg, options = MTS_options)
    @test abs(r.minimum - sqrt(8/27)) < 1e-6
    @test norm(r.minimizer - [1/3, 8/27]) < 1e-6
end
