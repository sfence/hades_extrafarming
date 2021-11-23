
local S = farming.intllib

-- pineapple seeds
minetest.register_node("hades_extrafarming:seed_pineapple", {
	description = S("Pineapple Seed"),
	tiles = {"farming_pineapple_seed.png"},
	inventory_image = "farming_pineapple_seed.png",
	wield_image = "farming_pineapple_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:pineapple_1")
	end,
})

-- pineapple top
minetest.register_craftitem("hades_extrafarming:pineapple_top", {
	description = S("Pineapple Top"),
	inventory_image = "farming_pineapple_top.png",
	groups = {seed = 2, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:pineapple_1")
	end
})

-- pineapple
minetest.register_node("hades_extrafarming:pineapple", {
	description = S("Pineapple"),
	drawtype = "plantlike",
	tiles = {"farming_pineapple.png"},
	inventory_image = "farming_pineapple.png",
	wield_image = "farming_pineapple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.27, -0.37, -0.27, 0.27, 0.44, 0.27}
	},
	groups = {food_pineapple = 1, fleshy = 3, dig_immediate = 3, flammable = 2}
})

-- pineapple
minetest.register_craftitem("hades_extrafarming:pineapple_ring", {
	description = S("Pineapple Ring"),
	inventory_image = "farming_pineapple_ring.png",
	groups = {food_pineapple_ring = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

minetest.register_craft( {
	output = "hades_extrafarming:pineapple_ring 5",
	recipe = {{"group:food_pineapple"}},
	replacements = {{"hades_extrafarming:pineapple", "hades_extrafarming:pineapple_top"},{"pineapple:pineapple", "pineapple:sapling"}}
})

-- pineapple juice
minetest.register_craftitem("hades_extrafarming:pineapple_juice", {
	description = S("Pineapple Juice"),
	inventory_image = "farming_pineapple_juice.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1, food = 3, eatable = 4}
})

minetest.register_craft({
	output = "hades_extrafarming:pineapple_juice",
	recipe = {
		{"group:food_pineapple_ring", "group:food_pineapple_ring",
				"group:food_pineapple_ring"},
		{"", "hades_extrafarming:juicer", ""},
		{"", "vessels:drinking_glass", ""}
	},
	replacements = {
		{"group:food_juicer", "hades_extrafarming:juicer"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:pineapple_juice 2",
	recipe = {
		{"group:food_pineapple", ""},
		{"hades_extrafarming:juicer", ""},
		{"vessels:drinking_glass", "vessels:drinking_glass"}
	},
	replacements = {
		{"group:food_juicer", "hades_extrafarming:juicer"}
	}
})

-- crop definition
local def = {
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"farming_pineapple_1.png"},
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
minetest.register_node("hades_extrafarming:pineapple_1", table.copy(def))

-- stage 2
def.tiles = {"farming_pineapple_2.png"}
minetest.register_node("hades_extrafarming:pineapple_2", table.copy(def))

-- stage 3
def.tiles = {"farming_pineapple_3.png"}
minetest.register_node("hades_extrafarming:pineapple_3", table.copy(def))

-- stage 4
def.tiles = {"farming_pineapple_4.png"}
minetest.register_node("hades_extrafarming:pineapple_4", table.copy(def))

-- stage 5
def.tiles = {"farming_pineapple_5.png"}
minetest.register_node("hades_extrafarming:pineapple_5", table.copy(def))

-- stage 6
def.tiles = {"farming_pineapple_6.png"}
minetest.register_node("hades_extrafarming:pineapple_6", table.copy(def))

-- stage 7
def.tiles = {"farming_pineapple_7.png"}
minetest.register_node("hades_extrafarming:pineapple_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_pineapple_8.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:pineapple"}, rarity = 1},
		{items = {"hades_extrafarming:pineapple"}, rarity = 10}
	}
}
minetest.register_node("hades_extrafarming:pineapple_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:pineapple"] = {
	crop = "hades_extrafarming:pineapple",
	seed = "hades_extrafarming:pineapple_top",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
