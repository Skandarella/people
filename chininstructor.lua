
local S = mobs.intllib


mobs.chininstructor_drops = {
"people:ewewarrior"
}

mobs:register_mob("people:chininstructor", {
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
	mesh = "Instructor.b3d",
	textures = {
		{"texturechininstructor.png"},

	},
	makes_footstep_sound = true,
	sounds = {
		random = "people_instructor",
		damage = "people_male5",
		death = "people_maledeath",
		distance = 10,
},
	walk_velocity = 1,
	run_velocity = 2,
	stepheight = 1,
	fear_height = 2,
	jump = true,
        jump_height = 3,
	drops = {		{name = "people:instructorgrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = {"default:gold_ingot"},
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
		walk_speed = 50,
		walk_start = 200,
		walk_end = 300,
		punch_speed = 100,
		punch_start = 300,
		punch_end = 400,
	},
	-- right clicking with raw meat will give Igor more health
	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "people:emblemoftriumph" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.chininstructor_drops or mobs.chininstructor_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("NPC dropped you an item for honor!"))

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

				minetest.chat_send_player(name, S("Instructor stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Instructor will follow you."))
			end
		end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "people:chininstructor",
	nodes = {"default:aspen_wood"},
	neighbors = {"people:weaponstand"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end
-- register spawn egg
mobs:register_egg("people:chininstructor", S("Instructor Aspen"), "achininstructor.png")

-- compatibility
mobs:alias_mob("people:chininstructor", "people:chininstructor")
