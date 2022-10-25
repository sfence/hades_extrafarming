
local S = farming.intllib

-- coffee seed
minetest.register_node("hades_extrafarming:seed_coffee", {
	description = S("Coffee Seed"),
	tiles = {"farming_coffee_seed.png"},
	inventory_image = "farming_coffee_seed.png",
	wield_image = "farming_coffee_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:coffee_1")
	end,
})
-- bug fix, can be removed later
minetest.register_alias("hades_extrafarming:coffee_seed", "hades_extrafarming:seed_coffee")

-- coffee
minetest.register_craftitem("hades_extrafarming:coffee_beans", {
	description = S("Coffee Beans"),
	inventory_image = "farming_coffee_beans.png",
	groups = {food_coffee = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "hades_extrafarming:coffee_beans",
	recipe = "hades_extrafarming:seed_coffee",
  cooktime = 10,
})

-- cup of coffee
minetest.register_node("hades_extrafarming:coffee_cup", {
	description = S("Cup of Coffee"),
	drawtype = "torchlike",
	tiles = {"farming_coffee_cup.png"},
	inventory_image = "farming_coffee_cup.png",
	wield_image = "farming_coffee_cup.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1, food = 3, eatable = 2},
	on_use = minetest.item_eat(2, "hades_vessels:drinking_glass"),
	sounds = hades_sounds.node_sound_glass_defaults()
})

minetest.register_alias("hades_extrafarming:coffee_cup_hot", "hades_extrafarming:coffee_cup")
minetest.register_alias("hades_extrafarming:drinking_cup", "hades_vessels:drinking_glass")

minetest.register_craft( {
	output = "hades_extrafarming:coffee_cup",
	recipe = {
		{"group:food_saucepan", "group:food_coffee", "group:food_water_glass"}
	},
	replacements = {
		{"group:food_saucepan", "hades_extrafarming:saucepan"}
	}
})

-- coffee definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_coffee_1.png"},
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
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:coffee_1", table.copy(def))

-- stage 2
def.tiles = {"farming_coffee_2.png"}
minetest.register_node("hades_extrafarming:coffee_2", table.copy(def))

-- stage 3
def.tiles = {"farming_coffee_3.png"}
minetest.register_node("hades_extrafarming:coffee_3", table.copy(def))

-- stage 4
def.tiles = {"farming_coffee_4.png"}
minetest.register_node("hades_extrafarming:coffee_4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_coffee_5.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:seed_coffee 2"}, rarity = 1},
		{items = {"hades_extrafarming:seed_coffee 2"}, rarity = 2},
		{items = {"hades_extrafarming:seed_coffee 2"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:coffee_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:coffee"] = {
	crop = "hades_extrafarming:coffee",
	seed = "hades_extrafarming:seed_coffee",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}

-- mapgen
local mg = farming.mapgen == "v6"

def = {
	y_max = mg and 50 or 55,
	spawn_on = mg and {"default:dirt_with_grass"} or {"default:dirt_with_dry_grass",
			"default:dirt_with_rainforest_litter", "default:dry_dirt_with_dry_grass"}
}

--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = def.spawn_on,
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.coffee,
		spread = {x = 100, y = 100, z = 100},
		seed = 12,
		octaves = 3,
		persist = 0.6
	},
	y_min = 20,
	y_max = def.y_max,
	decoration = "farming:coffee_5"
})
--]]
