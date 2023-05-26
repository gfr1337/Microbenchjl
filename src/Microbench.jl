#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf

abstract type Term
end

input(p::Term) = p.input

value(p::Term) = p.input

run(p::Term) = @printf("%40.37f\n", value(p))

struct PiTerm <: Term
    input::Float64
end

input(p::PiTerm) = p.input

value(p::PiTerm) = inv(input(p) * input(p))

function piterms(n::Int64)
    res = Vector{PiTerm}(undef, n)
    for i = 1:n
        res[i] = PiTerm(i)
    end
    res
end

pisum²(ps) = 6.0mapreduce(value, +, ps, init=0.0)

pisum²(n::Integer) = piterms(n) |> pisum²

pisum(n) = pisum²(n) |> sqrt

struct Program <: Term
    input::Int
end

input(p::Program) = p.input

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
