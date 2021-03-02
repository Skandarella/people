minetest.register_node("people:bootynode", {
	description = "Booty",
	tiles = {
		"people_bootynode_top.png",
		"people_bootynode_bottom.png",
		"people_bootynode_right.png",
		"people_bootynode_left.png",
		"people_bootynode_back.png",
		"people_bootynode_front.png"
	},
	groups = {choppy = 2},
	drop = "default:gold_lump 1",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:bootynode",
	burntime = 4,
})
