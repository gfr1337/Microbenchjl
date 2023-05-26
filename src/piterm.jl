module PiTerms
export PiTerm, piterms, pisumsq, pisum
using SimpleTraits
using Printf
using ..Terms

struct PiTerm
    input::Float64
end

piterms() = (PiTerm(i) for i = Iterators.countfrom(1))

@traitimpl Term{PiTerm}
Terms.inputtype(::Type{PiTerm}) = Float64
Terms.valuetype(::Type{PiTerm}) = Float64
Terms.value(p::PiTerm) = input(p)^(-2)

pisumsq(n) = 6.0*mapreduce(value, +, Iterators.take(piterms(), n), init=0.0)

pisum(n) = pisumsq(n) |> sqrt

end