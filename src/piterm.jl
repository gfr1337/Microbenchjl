using Printf

function pow(t::N, p::Integer)::N where N <: Number
    if p < 0 
        return pow(inv(t), -p)
    end
    acc = one(t)
    @simd for _ = 1:p
        acc *= t
    end
    acc
end

@fastmath function computepi2(n::AbstractRange{<:Integer})::Float64
    s = 0.0
    for i = n
        s += pow(inv(i), 2)
    end
    6.0*s
end

computepi2(n::Integer)::Float64 = computepi2(1:n)

const computepi² = computepi2

@fastmath computepi(ts)::Float64 = sqrt(computepi2(ts))

precompile(computepi2, (Int,))
