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

piterms() = piterms(Iterators.countfrom(1))
piterms(r) = (PiTerm(i) for i = r)

pisumsq(n) = 6.0*mapreduce(value, +, piterms(1:n), init=0.0)

pisum(n) = pisumsq(n) |> sqrt

end
