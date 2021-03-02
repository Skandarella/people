	mobs:register_mob("people:goat", {
		stay_near = {"farming:straw", 10, "people:feeder", 10},
		stepheight = 3,
		type = "animal",
		passive = false,
	        damage = 4,
		hp_min = 25,
		hp_max = 45,
		armor = 100,
		collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
		visual = "mesh",
		mesh = "Goat.b3d",
		textures = {
			{"texturegoat.png"},
		},
		makes_footstep_sound = true,
		sounds = {
		random = "people_goat",
		damage = "people_goat2",
		distance = 5,
},
		walk_velocity = 1,
		run_velocity = 2,
                walk_chance = 10,
		runaway = true,
		jump = true,
		jump_height = 3,
		pushable = true,
		drops = {
			{name = "people:mutton_raw", chance = 1, min = 1, max = 2},
			{name = "wool:white", chance = 1, min = 1, max = 2},
		},
		water_damage = 0,
		lava_damage = 5,
		light_damage = 0,
		animation = {
			speed_normal = 50,
			speed_run = 80,
			stand_start = 0,
			stand_end = 100,
			walk_start = 100,
			walk_end = 200,
			punch_start = 200,
			punch_end = 300,

			die_start = 1, -- we dont have a specific death animation so we will
			die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
			die_speed = 1, -- have mob rotate when dying.
			die_loop = false,
			die_rotate = true,
		},
		follow = {
			"farming:wheat", "default:grass_1", "farming:barley",
			"farming:oat", "farming:rye"
		},
		view_range = 8,
		replace_rate = 10,
		replace_what = {
			{"group:grass", "air", -1},
			{"default:dirt_with_grass", "default:dirt", -2}
		},
		fear_height = 4,
		on_replace = function(self, pos, oldnode, newnode)

			self.food = (self.food or 0) + 1

			-- if sheep replaces 8x grass then it regrows wool
			if self.food >= 8 then

				self.food = 0
				self.gotten = false

				self.object:set_properties({
					textures = {"texturegoat.png"},
					mesh = "Goat.b3d",
				})
			end
		end,
		on_rightclick = function(self, clicker)

			--are we feeding?
			if mobs:feed_tame(self, clicker, 8, true, true) then

				--if fed 7 times then sheep regrows wool
				if self.food and self.food > 6 then

					self.gotten = false

					self.object:set_properties({
						textures = {"texturegoat.png"},
						mesh = "Goat.b3d",
					})
				end

				return
			end

			local item = clicker:get_wielded_item()
			local itemname = item:get_name()
			local name = clicker:get_player_name()

			--are we giving a haircut>
			if itemname == "mobs:shears" then

				if self.gotten ~= false
				or self.child ~= false
				or name ~= self.owner
				or not minetest.get_modpath("wool") then
					return
				end

				self.gotten = true -- shaved

				local obj = minetest.add_item(
					self.object:get_pos(),
					ItemStack( "wool:white"  )
				)

				if obj then

					obj:setvelocity({
						x = math.random(-1, 1),
						y = 5,
						z = math.random(-1, 1)
					})
				end

				item:add_wear(650) -- 100 uses

				clicker:set_wielded_item(item)

				self.object:set_properties({
					textures = {"texturegoat2.png"},
					mesh = "Goat.b3d",
				})

				return
			end



			-- protect mod with mobs:protector item
			if mobs:protect(self, clicker) then return end

			--are we capturing?
			if mobs:capture_mob(self, clicker, 30, 50, 100, false, nil) then return end
		end
	})

mobs:register_egg("people:goat",  ("Goat"), "agoat.png")

mobs:alias_mob("people:goat", "people:goat") -- compatibility

-- raw mutton
minetest.register_craftitem(":people:mutton_raw", {
	description = ("Raw Mutton"),
	inventory_image = "people_mutton_raw.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, food_mutton_raw = 1, flammable = 2},
})

-- cooked mutton
minetest.register_craftitem(":people:mutton_cooked", {
	description = ("Cooked Mutton"),
	inventory_image = "people_mutton_cooked.png",
	on_use = minetest.item_eat(6),
	groups = {food_meat = 1, food_mutton = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "people:mutton_cooked",
	recipe = "people:mutton_raw",
	cooktime = 5,
})
