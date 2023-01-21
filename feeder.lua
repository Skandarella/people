local S = minetest.get_translator("people")

minetest.register_node("people:feeder", {
    description = S"Feeder",
    visual_scale = 1,
    mesh = "Feeder.b3d",
    tiles = {"texturefeeder.png"},
    inventory_image = "afeeder.png",
    paramtype = "light",
    paramtype2 = "facedir",
    walkable = false,
    groups = {choppy = 3},
    drawtype = "mesh",
		collisionbox = {-0.4, -0.01, -0.4, 0.4, 2.0, 0.4},
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:feeder",
	burntime = 4,
})
