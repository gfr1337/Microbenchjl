#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf

mutable struct PiTerm
    e::Float64
end

function piterm(p::PiTerm)
    inv(p.e*p.e)
end

function piterms(n::Int64)
    res = Vector{PiTerm}(undef, n)
    for i = 1:n
        res[i] = PiTerm(i)
    end
    res
end

pisum(ps) = sqrt(6.0mapreduce(piterm, +, ps, init=0.0))

pisum(n::Integer) = piterms(n) |> pisum

function run(p)
    @printf("%40.37f\n", pisum(p))
end

function main(n, e)
    let n = parse(Int, n), e = parse(Int, e)
        for i = 1:n
            run(e)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    @time main(ARGS...)
end

end # module Microbench
