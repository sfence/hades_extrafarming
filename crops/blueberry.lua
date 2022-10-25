
local S = farming.intllib

-- blueberries seed
minetest.register_node("hades_extrafarming:seed_blueberry", {
	description = S("Blueberries Seed"),
	tiles = {"farming_blueberry_seed.png"},
	inventory_image = "farming_blueberry_seed.png",
	wield_image = "farming_blueberry_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:blueberry_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_blueberry",
	recipe = {"group:food_blueberry"}
})

-- blueberries
minetest.register_craftitem("hades_extrafarming:blueberries", {
	description = S("Wild Blueberries"),
	inventory_image = "farming_blueberries.png",
	groups = {food_blueberries = 1, food_blueberry = 1,
			food_berry = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

-- blueberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)
minetest.register_craftitem("hades_extrafarming:muffin_blueberry", {
	description = S("Blueberry Muffin"),
	inventory_image = "farming_blueberry_muffin.png",
  groups = {food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "hades_extrafarming:muffin_blueberry 2",
	recipe = {
		{"group:food_blueberries", "group:food_bread", "group:food_blueberries"}
	}
})

-- Blueberry Pie
minetest.register_craftitem("hades_extrafarming:blueberry_pie", {
	description = S("Blueberry Pie"),
	inventory_image = "farming_blueberry_pie.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:blueberry_pie",
	recipe = {
		{"group:food_flour", "group:food_sugar", "group:food_blueberries"},
		{"group:food_baking_tray", "", ""}
	},
	replacements = {{"group:food_baking_tray", "hades_extrafarming:baking_tray"}}
})

-- Blue Dye
minetest.register_craft({
	output = "hades_dye:blue",
	recipe = {{"hades_extrafarming:blueberries"}}
})

-- blueberry definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_blueberry_1.png"},
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
minetest.register_node("hades_extrafarming:blueberry_1", table.copy(def))

-- stage 2
def.tiles = {"farming_blueberry_2.png"}
minetest.register_node("hades_extrafarming:blueberry_2", table.copy(def))

-- stage 3
def.tiles = {"farming_blueberry_3.png"}
minetest.register_node("hades_extrafarming:blueberry_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_blueberry_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:blueberries 2"}, rarity = 1},
		{items = {"hades_extrafarming:blueberries"}, rarity = 2},
		{items = {"hades_extrafarming:blueberries"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:blueberry_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:blueberries"] = {
	crop = "hades_extrafarming:blueberry",
	seed = "hades_extrafarming:seed_blueberry",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}

-- mapgen
--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.blueberry,
		spread = {x = 100, y = 100, z = 100},
		seed = 678,
		octaves = 3,
		persist = 0.6
	},
	y_min = 3,
	y_max = 15,
	decoration = "farming:blueberry_4"
})
--]]
