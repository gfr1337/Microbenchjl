using Printf

@fastmath function computepi2(n::AbstractRange{Int})::Float64
    s = 0.0
    for i = n
        t = inv(i)
        s += t*t
    end
    6.0*s
end

computepi2(n::Int)::Float64 = computepi2(1:n)

const computepi² = computepi2

@fastmath computepi(ts)::Float64 = sqrt(computepi2(ts))

precompile(computepi², (Int,))
