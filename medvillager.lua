local S = minetest.get_translator("people")

mobs:register_mob("people:medvillager", {
	stepheight = 1,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 30,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.35,-0.7,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Villager.b3d",
	visual_size = {x = 0.7, y = 0.7},
	textures = {
		{"texturemedvillager.png"},
	},
	makes_footstep_sound = true,
	sounds = {
			random = "people_female2",
		damage = "people_female4",
		death = "people_femaledeath",
		distance = 10,
	},
	walk_velocity = 1.5,
	run_velocity = 2.5,
        walk_chance = 10,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "people:pirate", "people:evilminer", "people:jealousminer", "people:hatefulminer", "people:plunderercrossbow", "people:plundererflask", "people:plundererstick"},
	jump = true,
	jump_height = 6,
	pushable = true,
        stay_near = {{"people:villagerbed", "xdecor:empty_shelf", "xdecor:intemframe", "xdecor:lantern", "xdecor:candle", "xdecor:multishelf", "xdecor:tv", "default:bookshelf", "vessels:shelf", "livingcaves:root_lamp", "default:chest", "default:mese_post_light_pine_wood", "default:meselamp", "default:mese_post_light_pine_wood", "default:mese_post_light", "default:mese_post_light_acacia_wood", "default:mese_post_light_aspen_wood", "default:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool"}, 4},
	follow = {"farming:baked_potato", "farming:sunflower_bread", "farming:pumpkin_bread", "farming:garlic_bread", "farming:tomato_soup", "pie:brpd_0", "farming:bread", "farming:bread_multigrain", "farming:spanish_potatoes", "farming:beetroot_soup", "farming:blueberry_pie", "farming:porridge", "farming:bibimbap", "farming:burger", "farming:paella", "farming:mac_and_cheese", "livingcaves:healingsoup", "farming:spaghetti", "animalworld:escargots", "farming:rhubarb_pie", "farming:potato_omlet", "farming:potato_salad"},
	view_range = 10,
	drops = {		{name = "people:villagergrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_speed = 65,
		walk_start = 200,
		walk_end = 300,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})


if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:medvillager",
	nodes = {"default:wood"},
	neighbors = {"people:villagerbed"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end

mobs:register_egg("people:medvillager", S("Villager Apple"), "amedvillager.png")


mobs:alias_mob("people:medvillager", "people:medvillager") -- compatibility

minetest.register_node("people:villagergrave", {
    description = S"Grave",
    visual_scale = 1,
    mesh = "Grave.b3d",
    tiles = {"texturegrave.png"},
    inventory_image = "agrave.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
		collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.4, 0.4},
    sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:villagergrave",
	burntime = 6,
})

