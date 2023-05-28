module PiTerm
export computepi, computepi2, computepi²

@inline @fastmath function _powx(x::N, n::Integer)::N where N <: Real
    acc = one(x)
    @simd for _ = 1:n
        acc *= x
    end
    acc
end

@fastmath @inline pow(x::Integer, n::Integer)::Float64 = @inline pow(Float64(x), n)
@fastmath @inline function pow(x::F, n::Integer)::F where F <: Union{AbstractFloat, Rational}
    if n < 0
        @inline _powx(inv(x), -n)
    else
        @inline _powx(Float64(x), n)
    end
end

@inline @fastmath function computepi2(n::AbstractRange{<:Integer})::Float64
    s = 0.0
    @simd for i = n
        s += pow(i, -2)
    end
    6.0*s
end

@inline computepi2(n::Integer)::Float64 = computepi2(1:n)

const computepi² = computepi2

@inline @fastmath computepi(ts)::Float64 = sqrt(computepi2(ts))

precompile(computepi2, (Int,))

end
