module PiTerms
export computepi, computepi²
using Printf

@fastmath function computepi²(n::Integer)::Float64
    computepi²(1:n)
end
@fastmath function computepi²(ts::AbstractVector{<:Integer})::Float64
    s = 0.0
    for i = ts
        t = inv(i)
        s += t*t
    end
    6.0*s
end

@fastmath computepi(ts::Union{Integer, AbstractVector{<:Integer}})::Float64 = sqrt(computepi²(ts))
precompile(computepi², (Int,))
precompile(computepi, (Int,))

end
