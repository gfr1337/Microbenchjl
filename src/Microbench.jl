#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf

abstract type Term{I, O} end

input(p::Term) = p.input

value(p::Term{I, I}) where I = p.input

run(p::Term{I, O}) where {I, O <: AbstractFloat} = @printf("%40.37f\n", value(p))

struct PiTerm <: Term{Float64, Float64}
    input::Float64
end

value(p::PiTerm) = inv(input(p) * input(p))

piterms(n) = (PiTerm(i) for i = 1:n)

pisum²(n) = 6.0*mapreduce(value, +, piterms(n), init=0.0)

pisum(n) = pisum²(n) |> sqrt

struct Program <: Term{Int, Float64}
    input::Int
end

value(p::Program) = input(p) |> pisum

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
