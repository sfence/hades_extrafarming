
local S = farming.intllib

-- beetroot
minetest.register_craftitem("hades_extrafarming:beetroot", {
	description = S("Beetroot"),
	inventory_image = "farming_beetroot.png",
	groups = {seed = 2, food_beetroot = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:beetroot_1")
	end,
	on_use = minetest.item_eat(1)
})

-- beetroot soup
minetest.register_craftitem("hades_extrafarming:beetroot_soup", {
	description = S("Beetroot Soup"),
	inventory_image = "farming_beetroot_soup.png",
	groups = {flammable = 2},
	on_use = minetest.item_eat(6, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:beetroot_soup",
	recipe = {
		"group:food_beetroot", "group:food_beetroot",
		"group:food_beetroot", "group:food_beetroot",
		"group:food_beetroot", "group:food_beetroot","group:food_bowl"
	}
})

-- red dye
minetest.register_craft({
	type = "shapeless",
	output = "dye:red",
	recipe = {"group:food_beetroot"}
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_beetroot_1.png"},
	paramtype = "light",
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
minetest.register_node("hades_extrafarming:beetroot_1", table.copy(def))

-- stage 2
def.tiles = {"farming_beetroot_2.png"}
minetest.register_node("hades_extrafarming:beetroot_2", table.copy(def))

-- stage 3
def.tiles = {"farming_beetroot_3.png"}
minetest.register_node("hades_extrafarming:beetroot_3", table.copy(def))

-- stage 4
def.tiles = {"farming_beetroot_4.png"}
minetest.register_node("hades_extrafarming:beetroot_4", table.copy(def))

-- stage 5
def.tiles = {"farming_beetroot_5.png"}
def.groups.growing = nil
def.drop = {
	max_items = 4, items = {
		{items = {"hades_extrafarming:beetroot"}, rarity = 1},
		{items = {"hades_extrafarming:beetroot"}, rarity = 2},
		{items = {"hades_extrafarming:beetroot"}, rarity = 3},
		{items = {"hades_extrafarming:beetroot"}, rarity = 4}
	}
}
minetest.register_node("hades_extrafarming:beetroot_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:beetroot"] = {
	crop = "hades_extrafarming:beetroot",
	seed = "hades_extrafarming:beetroot",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
