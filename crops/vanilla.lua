local S = farming.intllib

-- vanilla seeds
minetest.register_node("hades_extrafarming:seed_vanilla", {
	description = S("Vanilla Seed"),
	tiles = {"farming_vanilla_seed.png"},
	inventory_image = "farming_vanilla_seed.png",
	wield_image = "farming_vanilla_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:vanilla_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_vanilla",
	recipe = {"group:food_vanilla"},
})

-- vanilla
minetest.register_craftitem("hades_extrafarming:vanilla", {
	description = S("Vanilla"),
	inventory_image = "farming_vanilla.png",
	groups = {seed = 2, food_vanilla = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1),
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_vanilla_1.png"},
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

-- vanilla extract
minetest.register_node("hades_extrafarming:vanilla_extract", {
	description = S("Vanilla Extract"),
	drawtype = "plantlike",
	tiles = {"farming_vanilla_extract.png"},
	inventory_image = "farming_vanilla_extract.png",
	wield_image = "farming_vanilla_extract.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "hades_extrafarming:vanilla_extract",
	recipe = {
		{"group:food_vanilla", "group:food_vanilla", "group:food_vanilla"},
		{"group:food_vanilla", "hades_extrafarming:bottle_ethanol", "group:food_water_glass"},
	},
	replacements = {
		{"group:food_water_glass", "vessels:drinking_glass"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:vanilla_extract",
	burntime = 25,
	replacements = {{ "hades_extrafarming:vanilla_extract", "hades_vessels:glass_bottle" }}
})

-- stage 1
minetest.register_node("hades_extrafarming:vanilla_1", table.copy(def))

-- stage 2
def.tiles = {"farming_vanilla_2.png"}
minetest.register_node("hades_extrafarming:vanilla_2", table.copy(def))

-- stage 3
def.tiles = {"farming_vanilla_3.png"}
minetest.register_node("hades_extrafarming:vanilla_3", table.copy(def))

-- stage 4
def.tiles = {"farming_vanilla_4.png"}
minetest.register_node("hades_extrafarming:vanilla_4", table.copy(def))

-- stage 5
def.tiles = {"farming_vanilla_5.png"}
minetest.register_node("hades_extrafarming:vanilla_5", table.copy(def))

-- stage 6
def.tiles = {"farming_vanilla_6.png"}
def.visual_scale = 1.9
minetest.register_node("hades_extrafarming:vanilla_6", table.copy(def))

-- stage 7
def.tiles = {"farming_vanilla_7.png"}
def.drop = {
	items = {
		{items = {'hades_extrafarming:vanilla'}, rarity = 1},
		{items = {'hades_extrafarming:vanilla'}, rarity = 2},
		{items = {'hades_extrafarming:vanilla'}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:vanilla_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_vanilla_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {'hades_extrafarming:vanilla 2'}, rarity = 1},
		{items = {'hades_extrafarming:vanilla 2'}, rarity = 2},
		{items = {'hades_extrafarming:vanilla 2'}, rarity = 2},
		{items = {'hades_extrafarming:vanilla 2'}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:vanilla_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:vanilla"] = {
	crop = "hades_extrafarming:vanilla",
	seed = "hades_extrafarming:seed_vanilla",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.vanilla,
		spread = {x = 100, y = 100, z = 100},
		seed = 476,
		octaves = 3,
		persist = 0.6
	},
	y_min = 5,
	y_max = 35,
	decoration = "farming:vanilla_7"
})
