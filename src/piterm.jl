module PiTerms
export computepi, computepi², Program
using Base.Threads
using Printf
using SimpleTraits

function computepi²(ts)
    s = 0.0
    @simd for t = ts
        s += t^-2
    end
    6.0*s
end
computepi(ts) = sqrt(computepi²(ts))

end
