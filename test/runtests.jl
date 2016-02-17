using Tree
using Base.Test

tests = [
          "Tree"
        ]

for test in tests
    file_path = joinpath(dirname(@__FILE__), "test_$test.jl")
    println("Running tests for $file_path ...")
    include(file_path)
end
