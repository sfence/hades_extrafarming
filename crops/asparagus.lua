
local S = farming.intllib

-- asparagus
minetest.register_craftitem("hades_extrafarming:asparagus", {
	description = S("asparagus"),
	inventory_image = "farming_asparagus.png",
	groups = {seed = 2, food_asparagus = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:asparagus_1")
	end,
	on_use = minetest.item_eat(1)
})

-- asparagus definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_asparagus_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
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
minetest.register_node("hades_extrafarming:asparagus_1", table.copy(def))

-- stage 2
def.tiles = {"farming_asparagus_2.png"}
minetest.register_node("hades_extrafarming:asparagus_2", table.copy(def))

-- stage 3
def.tiles = {"farming_asparagus_3.png"}
minetest.register_node("hades_extrafarming:asparagus_3", table.copy(def))

-- stage 4
def.tiles = {"farming_asparagus_4.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:asparagus"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:asparagus_4", table.copy(def))

-- stage 5
def.tiles = {"farming_asparagus_5.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:asparagus"}, rarity = 1},
		{items = {"hades_extrafarming:asparagus 2"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:asparagus_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:asparagus"] = {
	crop = "hades_extrafarming:asparagus",
	seed = "hades_extrafarming:asparagus",
	minlight = 7,
	maxlight = farming.max_light,
	steps = 5
}

-- mapgen
--[[
minetest.register_decoration({
	name = "hades_extrafarming:asparagus_5",
	deco_type = "simple",
	place_on = {"hades_core:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = farming.asparagus,
		spread = {x = 100, y = 100, z = 100},
		seed = 234,
		octaves = 3,
		persist = 0.6
	},
	y_min = 8,
	y_max = 32,
	decoration = "hades_extrafarming:asparagus_5",
	param2 = 3
})
--]]
