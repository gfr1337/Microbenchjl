#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
export Term, inputtype, input, valuetype, value, PiTerm, piterms, pisum, pisumsq
using SimpleTraits
using Base.Iterators

include("terms.jl")
include("piterm.jl")

using .Terms, .PiTerms

function main(args)
    n = parse(Int, args[1])
    e = parse(Int, args[2])
    for _ = 1:n
        println(PiTerms.Program(e))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS[:])
end

end # module Microbench
