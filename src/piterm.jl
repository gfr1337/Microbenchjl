module PiTerms
export computepi, computepi²
using Base.Threads
using Printf

function computepi²(e)::Float64
    s = 0.0
    @fastmath for i = 1:e
        s += i ^ -2
    end
    6.0*s
end
@fastmath computepi(ts)::Float64 = sqrt(computepi²(ts))

end
