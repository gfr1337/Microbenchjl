module PiTerms
export PiTerm, pisumsq, pisum
using Base.Threads
using Printf
using SimpleTraits
using ..Terms

struct PiTerm
    input::Float64
end

@traitimpl Term{PiTerm}
Terms.inputtype(::Type{PiTerm}) = Float64
Terms.valuetype(::Type{PiTerm}) = Float64
Terms.value(p::PiTerm) = input(p)^-2

@fastmath function pisumsq(n) 
    s = 0.0
    for t = 1:n
        s += value(PiTerm(t))
    end
    6.0*s
end

@fastmath pisum(n) = pisumsq(n) |> sqrt

struct Program
    input::Int
end

@traitimpl Term{Program}
Terms.inputtype(::Type{Program}) = Int
Terms.valuetype(::Type{Program}) = Float64
Terms.value(p::Program) = input(p) |> pisum

function Base.print(out::IO, p::Program) 
    v = value(p)
    @printf(out, "%11.8f", v)
end

end
