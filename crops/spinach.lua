
local S = farming.intllib

-- spinach
minetest.register_craftitem("farming:spinach", {
	description = S("spinach"),
	inventory_image = "farming_spinach.png",
	groups = {seed = 2, food_spinach = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:spinach_1")
	end,
	on_use = minetest.item_eat(1)
})

-- definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_spinach_1.png"},
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
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:spinach_1", table.copy(def))

-- stage 2
def.tiles = {"farming_spinach_2.png"}
minetest.register_node("farming:spinach_2", table.copy(def))

-- stage 3
def.tiles = {"farming_spinach_3.png"}
def.drop = {
	items = {
		{items = {"farming:spinach"}, rarity = 1},
		{items = {"farming:spinach"}, rarity = 3}
	}
}
minetest.register_node("farming:spinach_3", table.copy(def))

-- stage 4
def.tiles = {"farming_spinach_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"farming:spinach 2"}, rarity = 1},
		{items = {"farming:spinach 2"}, rarity = 2},
		{items = {"farming:spinach 2"}, rarity = 3}
	}
}
minetest.register_node("farming:spinach_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:spinach"] = {
	crop = "farming:spinach",
	seed = "farming:spinach",
	minlight = 7,
	maxlight = farming.max_light,
	steps = 4
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = farming.spinach,
		spread = {x = 100, y = 100, z = 100},
		seed = 910,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"deciduous_forest"},
	y_max = 31000,
	y_min = 1,
	decoration = "farming:spinach_4",
	param2 = 3
})
