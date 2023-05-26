#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators

include("terms.jl")
include("piterm.jl")

using .Terms, .PiTerms

struct Program <: Term{Int, Float64}
    input::Int
end

Terms.value(p::Program) = input(p) |> pisum

function main(n, e)
    let n = parse(Int, n), e = parse(Int, e)
        programs = Vector{Program}(undef, n)
        for i = 1:n
            programs[i] = Program(e)
        end
        for p = programs
            run(p)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS...)
end

end # module Microbench
