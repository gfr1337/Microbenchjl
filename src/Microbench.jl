#!/usr/bin/env -S julia --startup-file=no --project=.
module Microbench
export Term, inputtype, input, valuetype, value, PiTerm, piterms, pisum
using Printf
using Base.Threads
using SimpleTraits

include("piterm.jl")

using .PiTerms

function main(n, e)
    for i = 1:n
        benchmark(100, e)
    end
end

function benchmark(n, e)
    t = @timed for i = 1:n
        v = pisum(1:e)
        @printf("%16.9f\n", v)
    end
    @printf(stdout, "%s Seconds\n", t.time)
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(10, 30000000)
end

end # module Microbench
