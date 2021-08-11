
--[[
	Original textures from Crops Plus mod
	Copyright (C) 2018 Grizzly Adam
	https://forum.minetest.net/viewtopic.php?f=9&t=19488
]]

local S = farming.intllib

-- garlic seed
minetest.register_node("hades_extrafarming:seed_garlic", {
	description = S("Garlic Seed"),
	tiles = {"farming_garlic_seed.png"},
	inventory_image = "farming_garlic_seed.png",
	wield_image = "farming_garlic_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:garlic_1")
	end,
})

-- garlic
minetest.register_craftitem("hades_extrafarming:garlic_clove", {
	description = S("Garlic clove"),
	inventory_image = "crops_garlic_clove.png",
	groups = {seeds = 2, food_garlic_clove = 1, flammable = 3},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:garlic_1")
	end,
})

-- garlic bulb
minetest.register_craftitem("hades_extrafarming:garlic", {
	description = S("Garlic"),
	inventory_image = "crops_garlic.png",
	on_use = minetest.item_eat(1),
	groups = {food_garlic = 1, flammable = 3, food = 2, eatable = 1}
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:garlic_clove 8",
	recipe = {"hades_extrafarming:garlic"}
})

minetest.register_craft({
	output = "hades_extrafarming:garlic",
	recipe = {
		{"hades_extrafarming:garlic_clove", "hades_extrafarming:garlic_clove", "hades_extrafarming:garlic_clove"},
		{"hades_extrafarming:garlic_clove", "", "hades_extrafarming:garlic_clove"},
		{"hades_extrafarming:garlic_clove", "hades_extrafarming:garlic_clove", "hades_extrafarming:garlic_clove"}
	}
})

-- garlic braid
minetest.register_node("hades_extrafarming:garlic_braid", {
	description = S("Garlic Braid"),
	inventory_image = "crops_garlic_braid.png",
	wield_image = "crops_garlic_braid.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"crops_garlic_braid_side.png","crops_garlic_braid.png",
		"crops_garlic_braid_side.png^[transformFx","crops_garlic_braid_side.png",
		"crops_garlic_braid.png","crops_garlic_braid.png"
	},
  use_texture_alpha = "opaque",
	groups = {vessel = 1, dig_immediate = 3, flammable = 3},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
				{-0.13, -0.45, 0.5, 0.13, 0.45, 0.24}
		}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:garlic_braid",
	recipe = {
		{"hades_extrafarming:garlic", "hades_extrafarming:garlic", "hades_extrafarming:garlic"},
		{"hades_extrafarming:garlic", "hades_extrafarming:garlic", "hades_extrafarming:garlic"},
		{"hades_extrafarming:garlic", "hades_extrafarming:garlic", "hades_extrafarming:garlic"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:garlic 9",
	recipe = {"hades_extrafarming:garlic_braid"}
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"crops_garlic_plant_1.png"},
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
minetest.register_node("hades_extrafarming:garlic_1", table.copy(def))

-- stage 2
def.tiles = {"crops_garlic_plant_2.png"}
minetest.register_node("hades_extrafarming:garlic_2", table.copy(def))

-- stage 3
def.tiles = {"crops_garlic_plant_3.png"}
minetest.register_node("hades_extrafarming:garlic_3", table.copy(def))

-- stage 4
def.tiles = {"crops_garlic_plant_4.png"}
minetest.register_node("hades_extrafarming:garlic_4", table.copy(def))

-- stage 5
def.tiles = {"crops_garlic_plant_5.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:garlic 3"}, rarity = 1},
		{items = {"hades_extrafarming:garlic"}, rarity = 2},
		{items = {"hades_extrafarming:garlic"}, rarity = 10},
		{items = {"hades_extrafarming:seed_garlic"}, rarity = 10}
	}
}
minetest.register_node("hades_extrafarming:garlic_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:garlic"] = {
	crop = "hades_extrafarming:garlic",
	seed = "hades_extrafarming:seed_garlic",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
