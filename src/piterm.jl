using Printf

@fastmath function computepi²(n::Integer)::Float64
    s = 0.0
    for i = 1:n
        t = inv(i)
        s += t*t
    end
    6.0*s
end

@fastmath computepi(ts::Integer)::Float64 = sqrt(computepi²(ts))

precompile(computepi², (Int,))
