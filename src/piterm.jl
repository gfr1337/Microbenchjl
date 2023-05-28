using Printf

begin
    global exptc
    local _exptc

    function _exptc(x, c::Int)
        if c == 0
            1
        elseif c == 1
            x
        elseif c > 1
            :($x * $(_exptc(x, c-1)))
        else
            :(inv($(_exptc(x, -c))))
        end
    end
    macro exptc(x, c)
        @gensym v
        quote
            $v = $(esc(x))
            $(_exptc(v, c))
        end
    end
end


@fastmath function computepi²(n::Integer)::Float64
    computepi²(1:n)
end
@fastmath function computepi²(ts::AbstractVector{<:Integer})::Float64
    s = 0.0
    for i = ts
        s += i ^ -2
    end
    6.0*s
end

@fastmath computepi(ts)::Float64 = sqrt(computepi²(ts))
