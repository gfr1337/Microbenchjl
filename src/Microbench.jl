#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Base.Iterators
using Printf

struct Program
    e::Float64
end

function value(p::Program)
    inv(p.e*p.e)
end

value(ps) = sqrt(6.0mapreduce(value, +, ps, init=0.0))

function run(p)
    @printf("%40.37f\n", value(p))
end

function main(args)
    e = parse(Int, args[2])
    n = parse(Int, args[1])
    for j = 1:n
        @timev begin
            programs = (Program(i) for i = 1:e)
            run(programs)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main(ARGS[:])
end

end # module Microbench
