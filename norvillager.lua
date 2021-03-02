mobs:register_mob("people:norvillager", {
	stepheight = 2,
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
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Villager.b3d",
	textures = {
		{"texturenorvillager.png"},
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
	jump_height = 3,
	pushable = true,
	follow = {"farming:turkish_delight", "farming:garlic_bread", "farming:donut", "farming:donut_chocolate", "farming:donut_apple", "farming:porridge", "farming:jaffa_cake", "farming:apple_pie", "farming:spaghetti", "farming:burger", "farming:bibimbap"},
	view_range = 10,
	drops = {		{name = "people:villagergrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_start = 200,
		walk_end = 300,
		run_speed = 200,
		run_start = 300,
		run_end = 300,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})


if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "people:norvillager",
	nodes = {"default:pine_wood"},
	neighbors = {"people:villagerbed"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end

mobs:register_egg("people:norvillager", ("Villager Pine"), "anorvillager.png")


mobs:alias_mob("people:norvillager", "people:norvillager") -- compatibility
