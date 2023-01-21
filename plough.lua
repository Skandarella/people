local S = minetest.get_translator("people")

mobs:register_mob("people:plough", {
	type = "npc",
	passive = true,
	damage = 3,
        reach = 2,
	group_attack = false,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 80,
	hp_max = 120,
	armor = 100,
	collisionbox = {-1.0,-0.1,-1.0, 1.0,1.0,1.0},
	visual = "mesh",
	mesh = "Plough.b3d",
	drawtype = "front",
	textures = {
		{"textureplough.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "people_ox3",
		damage = "people_ox",
		death = "people_ox2",
		distance = 15,
	},
	replace_rate = 0.01,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "farming:soil", -1}
	},
replace_what2 = {
		{"group:grass", "air", 0},
		{"default:dirt", "farming:soil", -1}
	},
	walk_velocity = 1,
	walk_chance = 100,
	run_velocity = 2,
	jump = false,
	walk_chance = 70,
	drops = {
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:wheat", "default:apple", "farming:oat",
		"farming:barley", "farming:corn", "ethereal:banana_single", "farming:corn_cob", "farming:cabbage", "default:dry_grass_1", "default:dry_grass_2", "default:dry_grass_3", "default:grass_1", "default:grass_2", "default:grass_3", "default:grass_4", "default:grass_5", "default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3", "default:coldsteppe_grass_1", "default:coldsteppe_grass_2", "default:coldsteppe_grass_3", "default:coldsteppe_grass_4", "default:coldsteppe_grass_5", "default:coldsteppe_grass_6", "naturalbiomes:savanna_grass1", "naturalbiomes:savanna_grass2", "naturalbiomes:savanna_grass3", "naturalbiomes:outback_grass1", "naturalbiomes:outback_grass2", "naturalbiomes:outback_grass3", "naturalbiomes:outback_grass4", "naturalbiomes:outback_grass5", "naturalbiomes:outback_grass6", "naturalbiomes:med_grass1", "naturalbiomes:med_grass2", "naturalbiomes:heath_grass1", "naturalbiomes:heath_grass2", "naturalbiomes:heath_grass3", "naturalbiomes:alpine_grass1", "naturalbiomes:alpine_grass2", "naturalbiomes:heath_grass2", "naturalbiomes:heath_grass3", "naturalbiomes:", "naturalbiomes:", "naturalbiomes:bushland_grass", "naturalbiomes:bushland_grass2", "naturalbiomes:bushland_grass3", "naturalbiomes:bushland_grass4", "naturalbiomes:bushland_grass5", "naturalbiomes:bushland_grass6", "naturalbiomes:bushland_grass7", "group:grass", "group:normal_grass"},
	view_range = 15,
	owner = "singleplayer",
	order = "follow",
	stepheight = 1,
	fear_height = 2,
	animation = {
		speed_normal = 25,
		stand_start = 0,
		stand_end = 100,
		stand1_start = 100,
		stand1_end = 200,
		stand2_start = 200,
		stand2_end = 300,
                walk_speed = 50,
		walk_start = 300,
		walk_end = 400,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},

on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, 25, 0, 25, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()




		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Plough stands still."))
			else
				self.order = "follow"

				minetest.chat_send_player(name, S("Plough will follow you."))
			end
		end
	end,
})


mobs:register_egg("people:plough", S("Plough"), "aplough.png")