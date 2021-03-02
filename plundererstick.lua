
mobs:register_mob("people:plundererstick", {
	type = "monster",
	passive = false,
	step_height = 2,
	fear_height = 4,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 3,
        damage = 7,
	hp_min = 25,
	hp_max = 65,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Plundererstick.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureplundererstick.png"},
	},
	sounds = {
		attack = "people_plundererstick3",
		random = "people_plunderersick",
		damage = "people_plundererstick2",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
        walk_chance = 10,
	runaway = false,
	jump = true,
	drops = {
		{name = "people:forge", chance = 7, min = 1, max = 1},
		{name = "people:feeder", chance = 7, min = 1, max = 1},
		{name = "people:mineshaft", chance = 7, min = 1, max = 1},
		{name = "people:villagerbed", chance = 7, min = 1, max = 1},
		{name = "people:weaponstand", chance = 7, min = 1, max = 1},
		{name = "people:firstaidnode", chance = 7, min = 1, max = 1},
		{name = "people:emblemoftriumph", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 100,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},
	view_range = 15,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "people:plundererstick",
	nodes = {"default:cobble", "default:mossycobble", "default:sandstonebrick"},
	neighbors = {"people:bootynode"},
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 10, -- 15000
	min_height = -25,
	max_height = 1000,
})
end

mobs:register_egg("people:plundererstick", ("Plunderer with a Stick"), "aplundererstick.png")
