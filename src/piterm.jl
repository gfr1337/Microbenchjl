module PiTerms
export PiTerm, piterms, pisumsq, pisum
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
Terms.value(p::PiTerm) = inv(input(p)*input(p))

function pisumsq(n) 
    s = 0.0
    @simd for t = 1:n
        s += value(PiTerm(t))
    end
    6.0*s
end

pisum(n) = pisumsq(n) |> sqrt

struct Program
    input::Int
end

@traitimpl Term{Program}
Terms.inputtype(::Type{Program}) = Int
Terms.valuetype(::Type{Program}) = Float64
Terms.value(p::Program) = input(p) |> pisum

Base.print(out::IO, p::Program) = @printf(out, "%40.37f", value(p))

end
