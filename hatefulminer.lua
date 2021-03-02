mobs:register_mob("people:hatefulminer", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 6,
	hp_min = 35,
	hp_max = 55,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Miner.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturehatefulminer.png"},
	},
	sounds = {
		attack = "people_evilminer2",
		random = "people_evilminer4",
		damage = "people_evilminer",
		death = "people_evilminer3",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	runaway = false,
	jump = true,
	drops = {
		{name = "default:iron_lump", chance = 1, min = 1, max = 1},
		{name = "people:emblemoftriumph", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_speed = 100,
		walk_start = 200,
		walk_end = 300,
		punch_speed = 100,
		punch_start = 300,
		punch_end = 400,
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
	name = "people:hatefulminer",
	nodes = {"default:stone"},
	neighbors = {"default:stone_with_iron", "default:stone_with_gold"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	min_height = -300,
	max_height = -80,
})
end

mobs:register_egg("people:hatefulminer", ("Hateful Miner"), "ahatefulminer.png")
