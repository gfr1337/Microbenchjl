module Terms
using SimpleTraits
using Printf
export Term, inputtype, input, valuetype, value, run

@traitdef Term{T}


@traitfn inputtype(p::T) where {T; Term{T}} = inputtype(T)
@traitfn valuetype(p::T) where {T; Term{T}} = valuetype(T)
function input end
function value end

end