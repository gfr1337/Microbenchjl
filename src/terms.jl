module Terms
using SimpleTraits
using Printf
export Term, inputtype, input, valuetype, value, run

@traitdef Term{T}

@traitfn inputtype(p::Type{T}) where {T; Term{T}} = Any
@traitfn valuetype(p::Type{T}) where {T; Term{T}} = Any
@traitfn inputtype(p::T) where {T; Term{T}} = inputtype(T)
@traitfn valuetype(p::T) where {T; Term{T}} = valuetype(T)
@traitfn input(p::T) where {T; Term{T}} = p.input
@traitfn value(p::T) where {T; Term{T}} = input(p)

end