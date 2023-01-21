local S = minetest.get_translator("people")

minetest.register_node("people:forge", {
    description = S"Anvil",
    visual_scale = 0.5,
    mesh = "Forge.b3d",
    tiles = {"textureforge.png"},
    inventory_image = "aforge.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    walkable = false,
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
            --[[{-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
            {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3}]]
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3}
        }
    },
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "people:forge",
})