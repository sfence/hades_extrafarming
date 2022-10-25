
local S = farming.intllib

-- rhubarb seeds
minetest.register_node("hades_extrafarming:seed_rhubarb", {
	description = S("Rhubarb Seed"),
	tiles = {"farming_rhubarb_seed.png"},
	inventory_image = "farming_rhubarb_seed.png",
	wield_image = "farming_rhubarb_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:rhubarb_1")
	end,
})

-- rhubarb
minetest.register_craftitem("hades_extrafarming:rhubarb", {
	description = S("Rhubarb"),
	inventory_image = "farming_rhubarb.png",
	groups = {food_rhubarb = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

-- rhubarb pie
minetest.register_craftitem("hades_extrafarming:rhubarb_pie", {
	description = S("Rhubarb Pie"),
	inventory_image = "farming_rhubarb_pie.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:rhubarb_pie",
	recipe = {
		{"hades_extrafarming:baking_tray", "group:food_sugar", ""},
		{"group:food_rhubarb", "group:food_rhubarb", "group:food_rhubarb"},
		{"group:food_wheat", "group:food_wheat", "group:food_wheat"}
	},
	replacements = {{"group:food_baking_tray", "hades_extrafarming:baking_tray"}}
})

-- rhubarb definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	minlight = 10,
	maxlight = 12
}

-- stage 1
minetest.register_node("hades_extrafarming:rhubarb_1", table.copy(def))

-- stage2
def.tiles = {"farming_rhubarb_2.png"}
minetest.register_node("hades_extrafarming:rhubarb_2", table.copy(def))

-- stage3
def.tiles = {"farming_rhubarb_3.png"}
minetest.register_node("hades_extrafarming:rhubarb_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_rhubarb_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
	{items = {"hades_extrafarming:rhubarb", "hades_extrafarming:seed_rhubarb"}, rarity = 1},
		{items = {"hades_extrafarming:rhubarb"}, rarity = 2},
		{items = {"hades_extrafarming:seed_rhubarb"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:rhubarb_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:rhubarb"] = {
	crop = "hades_extrafarming:rhubarb",
	seed = "hades_extrafarming:seed_rhubarb",
	minlight = 10,
	maxlight = 12,
	steps = 4
}

--[[
-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.rhubarb,
		spread = {x = 100, y = 100, z = 100},
		seed = 798,
		octaves = 3,
		persist = 0.6
	},
	y_min = 3,
	y_max = 20,
	decoration = "farming:rhubarb_3"
})
--]]
