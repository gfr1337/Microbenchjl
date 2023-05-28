module PiTerms
export computepi, computepi²
using Printf

@fastmath function computepi²(e::Integer)::Float64
    s = 0.0
    for i = 1:e
        s += i ^ -2
    end
    6.0*s
end

@fastmath computepi(ts)::Float64 = sqrt(computepi²(ts))
# precompile(computepi², (Int,))
# precompile(computepi, (Int,))

end
