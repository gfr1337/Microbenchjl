module Terms
using Printf
export Term, input, value, run

abstract type Term{I, O} end

input(p::Term) = p.input

value(p::Term{I, I}) where I = p.input

run(p::Term{I, O}) where {I, O <: AbstractFloat} = @printf("%40.37f\n", value(p))
end