# Tree

## Usage

    $ julia
    using Tree

    # create tree

    ## create nodes
    parent = Tree.Node("parent_value")
    child_1 = Tree.Node("child_1_value")
    child_2 = Tree.Node("child_2_value")
    grandchild = Tree.Node("grandchild_value")

    ## build tree
    Tree.add_children!(parent, [child_1, child_2])
    Tree.add_children!(child_1, [grandchild])

    # your tree:
    #       parent
    #       /    \
    #  child_1  child_2
    #     |
    # grandchild

    # get a Node value
    child_1.value
    #=> "child_1_value"

    # get Node children
    parent.children
    #=> 2-element Array{Tree.Node,1}: ...

    # get Node parent
    Tree.get_parent(child_1)
    #=> Tree.Node("parent_value",Nullable{Tree.Node}()...

    # check if Node is leaf (no children)
    Tree.is_leaf(grandchild)
    #=> true
    Tree.is_leaf(child_1)
    #=> false

    # check if Node is root (no parent)
    Tree.is_root(parent)
    #=> true
    Tree.is_root(grandchild)
    #=> false

    # get root Node
    Tree.get_root(parent)
    #=> Tree.Node("parent_value",Nullable{Tree.Node}()...
    Tree.get_root(child_1)
    #=> Tree.Node("parent_value",Nullable{Tree.Node}()...

    # check if Node is ancestor (above/parent) of other Node
    Tree.is_ancestor(parent, grandchild)
    #=> true
    Tree.is_ancestor(child_1, parent)
    #=> false

    # check if Node is descendant (below/child) of other Node
    Tree.is_descendant(child_2, parent)
    #=> true
    Tree.is_descendant(parent, grandchild)
    #=> false

    # check if Node is sibling (same parent) of other Node
    Tree.is_sibling(child_1, child_2)
    #=> true
    Tree.is_sibling(parent, grandchild)
    #=> false

    # get depth (distance from node to top)
    Tree.depth(parent)
    #=> 0
    Tree.depth(child_1)
    #=> 1
    Tree.depth(grandchild)
    #=> 2

    # get height (longest distance from node to bottom)
    Tree.height(parent)
    #=> 2
    Tree.height(child_1)
    #=> 1
    Tree.height(grandchild)
    #=> 0

    # all done? let's get out of here
    exit()

## Development

    # work in (`cd` to) your Julia location
    cd ~/.julia/v0.4/Tree

    # run tests
    make test
