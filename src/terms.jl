module Terms
using SimpleTraits
export Term, inputtype, input, valuetype, value

@traitdef Term{T}

@traitfn inputtype(p::Type{T}) where {T; Term{T}} = Any
@traitfn valuetype(p::Type{T}) where {T; Term{T}} = inputtype(p)
@traitfn inputtype(p::T) where {T; Term{T}} = inputtype(T)
@traitfn valuetype(p::T) where {T; Term{T}} = valuetype(T)
@traitfn input(p::T) where {T; Term{T}} = p.input
@traitfn value(p::T) where {T; Term{T}} = input(p)

end
