minetest.register_node("people:mineshaft", {
    description = "Mineshaft",
    visual_scale = 1.0,
    mesh = "Mineshaft.b3d",
    tiles = {"texturemineshaft.png"},
    inventory_image = "amineshaft.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {
            {-1, -0.5, -1, 1, -0.2, 1},
            --[[{-1, -0.5, -1, 1, -0.2, 1},
            {-1, -0.5, -1, 1, -0.2, 1}]]
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-1, -0.5, -1, 1, -0.2, 1}
        }
    },
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:mineshaft",
	burntime = 8,
})
