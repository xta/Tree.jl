# set / get value string

test_node = Tree.node
test_node.set_value("something")

@test test_node.value == "something"
@test test_node.value != "something_else"
