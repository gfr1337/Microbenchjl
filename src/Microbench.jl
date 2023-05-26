#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
export Term, inputtype, input, valuetype, value, PiTerm, piterms, pisum, pisumsq
using SimpleTraits
using Printf
using Base.Iterators

include("terms.jl")
include("piterm.jl")

using .Terms, .PiTerms

struct Program
    input::Int
end

@traitimpl Term{Program}
Terms.inputtype(::Type{Program}) = Int
Terms.valuetype(::Type{Program}) = Float64
Terms.value(p::Program) = input(p) |> pisum

Base.print(out::IO, p::Program) = @printf(out, "%40.37f", value(p))

function main(n, e)
    let n = parse(Int, n), e = parse(Int, e)
        for i = 1:n
            println(Program(e))
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS...)
end

end # module Microbench
