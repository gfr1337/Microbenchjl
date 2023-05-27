#!/usr/bin/env -S julia --startup-file=no --project=.
module Microbench
export Term, inputtype, input, valuetype, value, PiTerm, piterms, pisum, pisumsq
using Printf
using Base.Threads
using SimpleTraits

include("terms.jl")
include("piterm.jl")

using .Terms, .PiTerms

function main(args)
    n = parse(Int, args[1])
    e = parse(Int, args[2])
    progs = Vector{Float64}(undef, n)
    @threads for i = 1:length(progs)
        progs[i] = value(PiTerms.Program(e))
    end
    for v = progs
        @printf("%11.8f\n", v)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS)
end

end # module Microbench
