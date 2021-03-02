minetest.register_node("people:villagerbed", {
    description = "Villager Bed",
    visual_scale = 1.0,
    mesh = "Villagerbed.b3d",
    tiles = {"texturevillagerbed.png"},
    inventory_image = "avillagerbed.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {
            {-1, -0.5, -0.5, 0.9, 0.5, 0.5},
            --[[{-1, -0.5, -0.5, 0.9, 0.5, 0.5},
            {-1, -0.5, -0.5, 0.9, 0.5, 0.5}]]
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-1, -0.5, -0.5, 0.9, 0.5, 0.5}
        }
    },
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:villagerbed",
	burntime = 6,
})
