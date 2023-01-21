
local S = minetest.get_translator("people")


mobs.araminer_drops = {
"default:copper_lump", "default:tin_lump", "default:iron_lump", 
"default:gold_lump", "default:diamond", "default:copper_lump",
"default:iron_lump", "default:tin_lump", "default:copper_lump", "default:tin_lump", "default:iron_lump", 
"default:gold_lump"
}

mobs:register_mob("people:araminer", {
	type = "npc",
	passive = true,
	damage = 5,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 2,
	attack_monsters = true,
	attack_animals = false,
	attack_npc = false,
	hp_min = 25,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Miner.b3d",
	textures = {
		{"texturearaminer.png"},

	},
	makes_footstep_sound = true,
sounds = {		random = "people_miner",
		damage = "people_male5",
		death = "people_maledeath",
		distance = 10,
},
	walk_velocity = 1.5,
	run_velocity = 2,
	stepheight = 1,
	fear_height = 2,
	jump = true,
        jump_height = 3,
        stay_near = {{"people:mineshaft", "people:villagerbed", "xdecor:empty_shelf", "xdecor:intemframe", "xdecor:lantern", "xdecor:candle", "xdecor:multishelf", "xdecor:tv", "default:bookshelf", "vessels:shelf", "livingcaves:root_lamp", "default:chest", "default:mese_post_light_pine_wood", "default:meselamp", "default:mese_post_light_pine_wood", "default:mese_post_light", "default:mese_post_light_acacia_wood", "default:mese_post_light_aspen_wood", "default:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool"}, 4},
	drops = {		{name = "people:minergrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = {"farming:hemp_oil", "farming:hemp_leaf"},
	view_range = 15,
	owner = "",
	order = "follow",
	-- model animation
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
		die_start = 300,
		die_end = 400,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	-- right clicking with raw meat will give Igor more health
	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "farming:turkish_delight" or item:get_name() == "farming:donut_apple" or item:get_name() == "farming:porridge" or item:get_name() == "farming:jaffa_cake" or item:get_name() == "farming:apple_pie" or item:get_name() == "farming:spaghetti" or item:get_name() == "farming:burger" or item:get_name() == "farming:bibimbap" or item:get_name() == "farming:baked_potato" or item:get_name() == "farming:sunflower_bread" or item:get_name() == "farming:pumpkin_bread" or item:get_name() == "farming:garlic_bread" or item:get_name() == "farming:tomato_soup" or item:get_name() == "pie:brpd_0" or item:get_name() == "farming:bread" or item:get_name() == "farming:bread_multigrain" or item:get_name() == "farming:spanish_potatoes" or item:get_name() == "farming:beetroot_soup" or item:get_name() == "farming:farming:blueberry_pie" or item:get_name() == "farming:porridge" or item:get_name() == "farming:bibimbap" or item:get_name() == "farming:burger" or item:get_name() == "farming:paella" or item:get_name() == "farming:mac_and_cheese" or item:get_name() == "livingcaves:healingsoup" or item:get_name() == "farming:spaghetti" or item:get_name() == "animalworld:escargots" or item:get_name() == "farming:rhubarb_pie" or item:get_name() == "farming:potato_omlet" or item:get_name() == "farming:potato_salad" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.araminer_drops or mobs.araminer_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("NPC dropped you an item for food!"))

			return
		end

		-- if owner switch between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Miner stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Miner will follow you."))
			end
		end
	end,
})

if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:araminer",
	nodes = {"default:acacia_wood"},
	neighbors = {"people:mineshaft"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end
-- register spawn egg
mobs:register_egg("people:araminer", S("Miner Acacia"), "aaraminer.png")

-- compatibility
mobs:alias_mob("people:araminer", "people:araminer")
