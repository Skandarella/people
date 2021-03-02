
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("people") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "goat.lua") -- 
dofile(path .. "dog.lua") -- 
dofile(path .. "hunger.lua") -- 
dofile(path .. "forge.lua") -- 
dofile(path .. "feeder.lua") -- 
dofile(path .. "weaponstand.lua") -- 
dofile(path .. "villagerbed.lua") -- 
dofile(path .. "mineshaft.lua") -- 
dofile(path .. "firstaidnode.lua") -- 
dofile(path .. "bootynode.lua") -- 
dofile(path .. "plunderercrossbow.lua") -- 
dofile(path .. "pirate.lua") -- 
dofile(path .. "plundererstick.lua") -- 
dofile(path .. "plundererflask.lua") -- 
dofile(path .. "spawnbooty.lua") -- 
dofile(path .. "medsmith.lua") -- 
dofile(path .. "afrsmith.lua") -- 
dofile(path .. "norsmith.lua") -- 
dofile(path .. "chinsmith.lua") -- 
dofile(path .. "samsmith.lua") -- 
dofile(path .. "medfarmer.lua") -- 
dofile(path .. "norfarmer.lua") -- 
dofile(path .. "samfarmer.lua") -- 
dofile(path .. "afrfarmer.lua") -- 
dofile(path .. "chinfarmer.lua") -- 
dofile(path .. "medvillager.lua") -- 
dofile(path .. "aravillager.lua") -- 
dofile(path .. "papvillager.lua") -- 
dofile(path .. "ewevillager.lua") -- 
dofile(path .. "norvillager.lua") -- 
dofile(path .. "medminer.lua") -- 
dofile(path .. "araminer.lua") -- 
dofile(path .. "abominer.lua") -- 
dofile(path .. "eweminer.lua") -- 
dofile(path .. "norminer.lua") -- 
dofile(path .. "jealousminer.lua") -- 
dofile(path .. "hatefulminer.lua") -- 
dofile(path .. "evilminer.lua") -- 
dofile(path .. "meddoctor.lua") -- 
dofile(path .. "aradoctor.lua") -- 
dofile(path .. "chindoctor.lua") -- 
dofile(path .. "nordoctor.lua") -- 
dofile(path .. "papdoctor.lua") -- 
dofile(path .. "medwarrior.lua") -- 
dofile(path .. "norwarrior.lua") -- 
dofile(path .. "samwarrior.lua") -- 
dofile(path .. "ewewarrior.lua") -- 
dofile(path .. "afrwarrior.lua") -- 
dofile(path .. "medinstructor.lua") -- 
dofile(path .. "norinstructor.lua") -- 
dofile(path .. "chininstructor.lua") -- 
dofile(path .. "afrinstructor.lua") -- 
dofile(path .. "aboinstructor.lua") -- 
dofile(path .. "zombiedoctor.lua") -- 
dofile(path .. "zombiesmith.lua") -- 
dofile(path .. "zombievillager.lua") -- 
dofile(path .. "zombiewarrior.lua") -- 
dofile(path .. "zombiefarmer.lua") -- 
dofile(path .. "zombieinstructor.lua") -- 
dofile(path .. "zombieminer.lua") -- 
dofile(path .. "ridepig.lua") -- 
dofile(path .. "rideelephant.lua") -- 
dofile(path .. "rideostrich.lua") -- 
dofile(path .. "ridehorse.lua") -- 
dofile(path .. "ridereindeer.lua") -- 
dofile(path .. "rideox.lua") -- 

-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end



print (S("[MOD] Mobs Redo Animals loaded"))
