minetest.register_node("people:firstaidnode", {
	description = "First Aid Node",
	tiles = {
		"people_firstaidnode_top.png",
		"people_firstaidnode_bottom.png",
		"people_firstaidnode_right.png",
		"people_firstaidnode_left.png",
		"people_firstaidnode_back.png",
		"people_firstaidnode_front.png"
	},
	groups = {choppy = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:firstaidnode",
	burntime = 4,
})
