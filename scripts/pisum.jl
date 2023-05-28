#!/usr/bin/env -S julia --startup-file=no
Base.set_active_project(dirname(@__FILE__) * "/..")
using Microbench
runbenchmark()
