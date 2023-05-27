module PiTerms
export PiTerm, pisum, pisumsq, Program
using Base.Threads
using Printf
using SimpleTraits

@fastmath function invsq(i)
    t = 1/i
    t*t
end
@fastmath function pisumsq(ts)
    s = 0.0
    for t = ts
        s += invsq(t)
    end
    6.0*s
end
pisum(ts) = sqrt(pisumsq(ts))

end
