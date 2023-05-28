#!/usr/bin/env -S julia --startup-file=no --project=.
module Microbench
export computepi², computepi, runbenchmark, benchmark
using Printf
using Base.Threads

include("piterm.jl")

function runbenchmark(n::Int=10, e::Int=30_000_000)::Nothing
    println("Julia")
    for i = 1:n
        benchmark(100, e)
    end
end

function benchmark(n::Int, e::Int)::Nothing
    t = @timed for i = 1:n
        v = computepi(e)
        @printf("%16.9f\n", v)
    end
    @printf(stdout, "%s Seconds\n", t.time)
end

# precompile(benchmark, (Int, Int))
precompile(runbenchmark, ())

if abspath(PROGRAM_FILE) == @__FILE__()
    runbenchmark()
end

end # module Microbench
