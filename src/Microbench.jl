#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf


function computepi²(e)
    s = 0.0
    for i = 1:e
        t = Float64(i)
        s += 1.0/(t*t)
    end
    6.0*s
end

computepi(e) = sqrt(computepi²(e))

struct Program
    n::Int
end

function run(p::Program)
    for i = 1:1000
        @printf("%40.37f\n", computepi(30_000_000))
    end
end

function main(args::String...)
    for arg = args
        run(Program(parse(Int, arg)))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS...)
end

end # module Microbench
