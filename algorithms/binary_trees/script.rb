require './tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree.balanced?
puts tree.root.data
tree.level_order{|value| puts value.data}
tree.insert(150)
tree.insert(140)
tree.insert(180)
tree.insert(110)
tree.insert(181)
tree.insert(143)
puts tree.balanced?
tree.rebalance!
puts tree.balanced?
tree.level_order{|value| puts value.data}