module PiTerms
export PiTerm, piterms, pisumsq, pisum
using SimpleTraits
using ..Terms

struct PiTerm
    input::Int
end

@traitimpl Term{PiTerm}
Terms.inputtype(::Type{PiTerm}) = Int
Terms.valuetype(::Type{PiTerm}) = Float64
Terms.value(p::PiTerm) = inv(input(p)*input(p))

piterms() = (PiTerm(i) for i = Iterators.countfrom(1))
piterms(n) = (PiTerm(i) for i = 1:n)

pisumsq(n) = 6.0*mapreduce(value, +, piterms(n), init=0.0)

pisum(n) = pisumsq(n) |> sqrt

end
