
mobs:register_mob("people:plunderercrossbow", {
	-- animal, monster, npc
	type = "monster",
	-- aggressive, shoots shuriken
	passive = false,
	step_height = 2,
	fear_height = 4,
	damage = 7,
	attack_type = "shoot",
	shoot_interval = 2,
	arrow = "people:bolt",
	shoot_offset = 2,
	attacks_monsters = false,
	-- health & armor
	hp_min = 30, hp_max = 50, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Plunderercrossbow.b3d",
	drawtype = "front",
	textures = {
		{"textureplunderercrossbow.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "people_plunderercrossbow2",
		random = "people_plunderercrossbow",
		damage = "people_plunderercrossbow3",
		distance = 15,
},
	-- speed and jump
	walk_velocity = 2,
	run_velocity = 3,
        walk_chance = 10,
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
	-- damaged by
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	view_range = 15,
	-- model animation
	animation = {
		speed_normal = 70,		speed_run = 100,
		stand_speed = 50,
		stand_start = 0,		stand_end = 100,
		walk_start = 100,		walk_end = 200,
		run_start = 100,		run_end = 200,
		shoot_start = 200,		shoot_end = 300,
                speed_shoot = 55,
	},
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "people:plunderercrossbow",
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

mobs:register_egg("people:plunderercrossbow", "Plunderer with Crossbow", "aplunderercrossbow.png")

mobs:register_arrow("people:bolt", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"bolt.png"},
	velocity = 12,
	drop = true,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=13},
                }, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=13},
                }, nil)
	end,

	hit_node = function(self, pos, node)
	end,
})
