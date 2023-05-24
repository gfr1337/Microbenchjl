#!/usr/bin/env -S julia --startup-file=no --project=@
module Microbench
using Printf

function pigen(s, e)
    res = zero(Float64)
    for i = s:e
        t = Float64(i)
        res += 1/(t*t)
    end
    sqrt(6.0res)
end

function main()
    for i = 1:100
        @printf("%40.37f\n", pigen(1, 30_000_000))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__()
    main()
end

end # module Microbench
