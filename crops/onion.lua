
--[[
	Original textures from Crops Plus mod
	Copyright (C) 2018 Grizzly Adam
	https://forum.minetest.net/viewtopic.php?f=9&t=19488
]]

local S = farming.intllib

-- onion seeds
minetest.register_node("hades_extrafarming:seed_onion", {
	description = S("Onion Seed"),
	tiles = {"farming_onion_seed.png"},
	inventory_image = "farming_onion_seed.png",
	wield_image = "farming_onion_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:onion_1")
	end,
})

-- onion
minetest.register_craftitem("hades_extrafarming:onion", {
	description = S("Onion"),
	inventory_image = "crops_onion.png",
	groups = {seed = 2, food_onion = 1, flammable = 3, food = 2, eatable = 1},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:onion_1")
	end,
	on_use = minetest.item_eat(1)
})

-- onion soup
minetest.register_craftitem("hades_extrafarming:onion_soup", {
	description = S("Onion Soup"),
	inventory_image = "farming_onion_soup.png",
	groups = {flammable = 2, food = 2, eatable = 6},
	on_use = minetest.item_eat(6, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:onion_soup",
	recipe = {
		"group:food_onion", "group:food_onion", "group:food_pot",
		"group:food_onion", "group:food_onion",
		"group:food_onion", "group:food_onion", "group:food_bowl"
	},
	replacements = {{"hades_extrafarming:pot", "hades_extrafarming:pot"}}
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"crops_onion_plant_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 3, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:onion_1", table.copy(def))

-- stage 2
def.tiles = {"crops_onion_plant_2.png"}
minetest.register_node("hades_extrafarming:onion_2", table.copy(def))

-- stage 3
def.tiles = {"crops_onion_plant_3.png"}
minetest.register_node("hades_extrafarming:onion_3", table.copy(def))

-- stage 4
def.tiles = {"crops_onion_plant_4.png"}
minetest.register_node("hades_extrafarming:onion_4", table.copy(def))

-- stage 5
def.tiles = {"crops_onion_plant_5.png"}
def.groups.growing = nil
def.drop = {
	max_items = 5, items = {
		{items = {"hades_extrafarming:onion"}, rarity = 1},
		{items = {"hades_extrafarming:onion"}, rarity = 1},
		{items = {"hades_extrafarming:onion"}, rarity = 2},
		{items = {"hades_extrafarming:onion"}, rarity = 2},
		{items = {"hades_extrafarming:onion"}, rarity = 5},
	}
}
minetest.register_node("hades_extrafarming:onion_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:onion"] = {
	crop = "hades_extrafarming:onion",
	seed = "hades_extrafarming:onion",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
