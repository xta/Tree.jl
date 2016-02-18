# Tree

## Usage

    $ julia
    julia> using Tree

    julia> n = Tree.Node("my_value")
    #=> Tree.Node("my_value")

    julia> n.value
    #=> "my_value"

    julia> exit()

## Development

    # work in (`cd` to) your Julia location
    cd ~/.julia/v0.4/Tree

    # run tests
    make test
