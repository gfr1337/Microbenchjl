module PiTerm
export computepi, computepi2, computepi²


@fastmath function computepi2(n::AbstractRange{<:Integer})::Float64
    s = 0.0
    @simd for i = n
        s += i ^ -2
    end
    6.0*s
end

computepi2(n::Integer)::Float64 = computepi2(1:n)

const computepi² = computepi2

@fastmath computepi(ts)::Float64 = sqrt(computepi2(ts))

precompile(computepi2, (Int,))

end
