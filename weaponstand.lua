minetest.register_node("people:weaponstand", {
    description = "Weaponstand",
    visual_scale = 1,
    mesh = "Weaponstand.b3d",
    tiles = {"textureweaponstand.png"},
    inventory_image = "aweaponstand.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
		collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.4, 0.4},
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "people:weaponstand",
})