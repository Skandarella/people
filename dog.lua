mobs:register_mob("people:dog", {
	stay_near = {"people:dogfoodsack", 10},
	type = "animal",
	visual = "mesh",
	mesh = "Dog.b3d",
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
	animation = {
		speed_normal = 100,
		stand_speed = 50,
		stand_start = 400,
		stand_end = 500,
		stand2_speed = 50,
		stand2_start = 250,
		stand2_end = 350,
		stand3_speed = 50,
		stand3_start = 400,
		stand3_end = 500,
		stand4_speed = 50,
		stand4_start = 500,
		stand4_end = 600,
		stand5_speed = 50,
		stand5_start = 500,
		stand5_end = 600,
		walk_start = 0,
		walk_end = 100,
		punch_start = 100,
		punch_end = 200,
		punch2_start = 100,
		punch2_end = 200,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	textures = {
		{"texturedog.png"}
	},
	fear_height = 3,
	runaway = false,
	jump = true,
	jump_height = 6,
	fly = false,
	walk_velocity = 1,
	run_velocity = 4,
	view_range = 10,
	passive = false,
	attack_type = "dogfight",
	damage = 9,
	reach = 2,
	attack_monsters = true,
	attack_animals = false,
	attack_npcs = false,
	pathfinding = true,
	group_attack = true,
	hp_min = 35,
	hp_max = 100,
	armor = 100,
	knock_back = 2,
	lava_damage = 5,
	fall_damage = 1,
	water_damage = 0,
	makes_footstep_sound = true,
	sounds = {
			attack = "people_dog4",
		random = "people_dog2",
		damage = "people_dog3",
		death = "people_dog5",
		distance = 10,
	},
	follow = {"mobs:meat_raw", "people:dogfood", "people:dogfood_cooked"},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 6, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 100, false, nil) then return end

		if clicker:get_wielded_item():is_empty() and clicker:get_player_name() == self.owner then
			if clicker:get_player_control().sneak then
				self.order = ""
				self.state = "walk"
				self.walk_velocity = 2
				self.stepheight = 2
			else
				if self.order == "follow" then
					self.order = "stand"
					self.state = "stand"
					self.walk_velocity = 2
					self.stepheight = 2
				else
					self.order = "follow"
					self.state = "walk"
					self.walk_velocity = 3
					self.stepheight = 2
				end
			end
			return
		end
	end
})

mobs:register_egg("people:dog", "Dog", "adog.png")
-- raw dogfood
minetest.register_craftitem(":people:dogfood", {
	description = ("Dog Food"),
	inventory_image = "people_dogfood.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, food_mutton_raw = 1, flammable = 2},
})

-- cooked dogfood
minetest.register_craftitem(":people:dogfood_cooked", {
	description = ("Cooked Dog Food"),
	inventory_image = "people_dogfood_cooked.png",
	on_use = minetest.item_eat(6),
	groups = {food_meat = 1, food_mutton = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "people:dogfood_cooked",
	recipe = "people:dogfood",
	cooktime = 5,
})


minetest.register_node("people:dogfoodsack", {
	description = "Sack of Dog Food",
	tiles = {
		"people_dogfoodsack_top.png",
		"people_dogfoodsack_bottom.png",
		"people_dogfoodsack_right.png",
		"people_dogfoodsack_left.png",
		"people_dogfoodsack_back.png",
		"people_dogfoodsack_front.png"
	},
	groups = {crumbly = 3},
	drop = "people:dogfood 9",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "people:dogfoodsack",
	recipe = {
		{"people:dogfood", "people:dogfood", "people:dogfood"},
		{"people:dogfood", "people:dogfood", "people:dogfood"},
		{"people:dogfood", "people:dogfood", "people:dogfood"},
	}
})