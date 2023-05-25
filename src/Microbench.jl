#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf

struct PiTerm
    e::Float64
end

function piterm(p::PiTerm)
    inv(p.e*p.e)
end

piterms(n) = (PiTerm(i) for i = 1:n)

pisum(ps) = sqrt(6.0mapreduce(piterm, +, ps))

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
