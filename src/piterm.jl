module PiTerms
export computepi, computepi², Program
using Base.Threads
using Printf

function computepi²(e)::Float64
    s = 0.0
    @fastmath for i = 1:e
        t = inv(i)
        s += t*t
    end
    6.0*s
end
computepi(ts) = sqrt(computepi²(ts))

end
