#!/usr/bin/env -S julia --startup-file=no --project=.
module Microbench
export Term, inputtype, input, valuetype, value, PiTerm, piterms, pisum
using Printf
using Base.Threads
using SimpleTraits

include("piterm.jl")

using .PiTerms

function main(args)
    n = parse(Int, args[1])
    e = parse(Int, args[2])
    v = @timed benchmark(n, e)
    @printf(stderr, "%s Seconds\n", v.time)
end

function benchmark(n, e)
    for i = 1:n
        v = pisum(1:e)
        @printf("%16.9f\n", v)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS)
end

end # module Microbench
