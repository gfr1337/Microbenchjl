module PiTerms
export PiTerm, pisumsq, pisum
using Base.Threads
using Printf
using SimpleTraits
using ..Terms

struct PiTerm
    input::Int
end

@traitimpl Term{PiTerm}
Terms.inputtype(::Type{PiTerm}) = Int
Terms.valuetype(::Type{PiTerm}) = Float64
Terms.value(p::PiTerm) = input(p) ^ -2

function pisumsq(ts)
    s = 0.0
    @simd for t = ts
        s += value(PiTerm(t))
    end
    6.0*s
end

pisum(ts) = pisumsq(ts) |> sqrt

struct Program
    input::Int
end

@traitimpl Term{Program}
Terms.inputtype(::Type{Program}) = Int
Terms.valuetype(::Type{Program}) = Float64
Terms.value(p::Program) = 1:input(p) |> pisum

function Base.print(out::IO, p::Program) 
    v = value(p)
    @printf(out, "%11.8f", v)
end

end
