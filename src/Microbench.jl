#!/usr/bin/env -S julia --startup-file=no --project=.
module Microbench
export computepi², computepi
using Printf
using Base.Threads

include("piterm.jl")

using .PiTerms

function main(n::Int=10, e::Int=30000000)::Nothing
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


for i = 0:2
    precompile(main, ntuple(_ -> Int, i))
end

end # module Microbench
