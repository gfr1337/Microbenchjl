using Printf


macro exptc(x, c::Integer)
    function _exptc(x, c)
        if c == 0
            1
        elseif c == 1
            x
        elseif c > 1
            :($x * $(_exptc(x, c-1)))
        end
    end
    @gensym v
    if c > 0
        quote
            $v = $(esc(x))
            $(_exptc(v, c))
        end
    else
        quote
            $v = inv($(esc(x)))
            $(_exptc(v, -c))
        end
    end
end


@fastmath function computepi²(n::Integer)::Float64
    computepi²(1:n)
end
@fastmath function computepi²(ts::AbstractVector{<:Integer})::Float64
    s = 0.0
    for i = ts
        s += @exptc(i, -2)
    end
    6.0*s
end

@fastmath computepi(ts)::Float64 = sqrt(computepi²(ts))
