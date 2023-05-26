module PiTerms
export PiTerm, piterms, pisumsq, pisum
using Printf
using ..Terms

struct PiTerm <: Term{Float64, Float64}
    input::Float64
end

piterms() = (PiTerm(i) for i = Iterators.countfrom(1))

Terms.value(p::PiTerm) = inv(input(p) * input(p))

pisumsq(n) = 6.0*mapreduce(value, +, Iterators.take(piterms(), n), init=0.0)

pisum(n) = pisumsq(n) |> sqrt

end