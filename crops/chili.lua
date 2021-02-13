
local S = farming.intllib

-- chili pepper seed
minetest.register_node("hades_extrafarming:seed_chili", {
	description = S("Chili Seed"),
	tiles = {"farming_chili_seed.png"},
	inventory_image = "farming_chili_seed.png",
	wield_image = "farming_chili_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:chili_1")
	end,
})

-- chili pepper
minetest.register_craftitem("hades_extrafarming:chili_pepper", {
	description = S("Chili Pepper"),
	inventory_image = "farming_chili_pepper.png",
	groups = {food_chili_pepper = 1, flammable = 4, food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

-- bowl of chili
minetest.register_craftitem("hades_extrafarming:chili_bowl", {
	description = S("Bowl of Chili"),
	inventory_image = "farming_chili_bowl.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:chili_bowl",
	recipe = {
		"group:food_chili_pepper", "group:food_barley",
		"group:food_tomato", "group:food_beans", "group:food_bowl"
	},
  replacements = {{"hades_extrafarming:chili_pepper", "hades_extrafarming:seed_chili"}},
})

-- chili can be used for red dye
minetest.register_craft({
	output = "dye:red",
	recipe = {
		{"hades_extrafarming:chili_pepper"}
	},
  replacements = {{"hades_extrafarming:chili_pepper", "hades_extrafarming:seed_chili"}},
})

-- chili definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_chili_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:chili_1", table.copy(def))

-- stage 2
def.tiles = {"farming_chili_2.png"}
minetest.register_node("hades_extrafarming:chili_2", table.copy(def))

-- stage 3
def.tiles = {"farming_chili_3.png"}
minetest.register_node("hades_extrafarming:chili_3", table.copy(def))

-- stage 4
def.tiles = {"farming_chili_4.png"}
minetest.register_node("hades_extrafarming:chili_4", table.copy(def))

-- stage 5
def.tiles = {"farming_chili_5.png"}
minetest.register_node("hades_extrafarming:chili_5", table.copy(def))

-- stage 6
def.tiles = {"farming_chili_6.png"}
minetest.register_node("hades_extrafarming:chili_6", table.copy(def))

-- stage 7
def.tiles = {"farming_chili_7.png"}
minetest.register_node("hades_extrafarming:chili_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_chili_8.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:chili_pepper 3"}, rarity = 1},
		{items = {"hades_extrafarming:chili_pepper 2"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:chili_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:chili_pepper"] = {
	crop = "hades_extrafarming:chili",
	seed = "hades_extrafarming:seed_chili",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
