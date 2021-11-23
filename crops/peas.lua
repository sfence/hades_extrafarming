
local S = farming.intllib

-- Textures for Pea crop and Peas were done by Andrey01

-- pea seeds
minetest.register_node("hades_extrafarming:seed_pea", {
	description = S("Pea Seed"),
	tiles = {"farming_pea_seed.png"},
	inventory_image = "farming_pea_seed.png",
	wield_image = "farming_pea_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:pea_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_pea",
	recipe = {"hades_extrafarming:peas"}
})

-- pea pod
minetest.register_craftitem("hades_extrafarming:pea_pod", {
	description = S("Pea Pod"),
	inventory_image = "farming_pea_pod.png",
	groups = {food_pea_pod = 1, flammable = 2},
})

minetest.register_craftitem("hades_extrafarming:peas", {
	description = S("Peas"),
	inventory_image = "farming_pea_peas.png",
	groups = {food_peas = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	output = "hades_extrafarming:peas",
	recipe = {{"hades_extrafarming:pea_pod"}}
})

-- pea soup
minetest.register_craftitem("hades_extrafarming:pea_soup", {
	description = S("Pea Soup"),
	inventory_image = "farming_pea_soup.png",
	groups = {flammable = 2, food = 3, eatable = 4},
	on_use = minetest.item_eat(4, "hades_extrafarming:bowl")
})

minetest.register_craft({
	output = "hades_extrafarming:pea_soup",
	recipe = {
		{"group:food_peas"},
		{"group:food_peas"},
		{"group:food_bowl"}
	}
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_pea_1.png"},
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
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:pea_1", table.copy(def))

-- stage 2
def.tiles = {"farming_pea_2.png"}
minetest.register_node("hades_extrafarming:pea_2", table.copy(def))

-- stage 3
def.tiles = {"farming_pea_3.png"}
minetest.register_node("hades_extrafarming:pea_3", table.copy(def))

-- stage 4
def.tiles = {"farming_pea_4.png"}
minetest.register_node("hades_extrafarming:pea_4", table.copy(def))

-- stage 5
def.tiles = {"farming_pea_5.png"}
def.groups.growing = nil
def.drop = {
	max_items = 5, items = {
		{items = {"hades_extrafarming:pea_pod"}, rarity = 1},
		{items = {"hades_extrafarming:pea_pod"}, rarity = 2},
		{items = {"hades_extrafarming:pea_pod"}, rarity = 3},
		{items = {"hades_extrafarming:pea_pod"}, rarity = 5}
	}
}
minetest.register_node("hades_extrafarming:pea_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:pea_pod"] = {
	crop = "hades_extrafarming:pea",
	seed = "hades_extrafarming:pea_pod",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
