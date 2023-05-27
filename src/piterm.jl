module PiTerms
export PiTerm, piterms, pisumsq, pisum
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

piterms() = piterms(Iterators.countfrom(1))
piterms(r) = (PiTerm(i) for i = r)

function pisumsq(n) 
    6.0*reduce(piterms(1:n), init=0.0) do a, v
        a + value(v) 
    end
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
