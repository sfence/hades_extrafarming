
--[[
	Textures edited from:
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/1288375-food-plus-mod-more-food-than-you-can-imagine-v2-9)
]]

local S = farming.intllib

-- tomato
minetest.register_craftitem("hades_extrafarming:tomato", {
	description = S("Tomato"),
	inventory_image = "farming_tomato.png",
	groups = {seed = 2, food_tomato = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:tomato_1")
	end,
	on_use = minetest.item_eat(4)
})

-- tomato soup
minetest.register_craftitem("farming:tomato_soup", {
	description = S("Tomato Soup"),
	inventory_image = "farming_tomato_soup.png",
	groups = {flammable = 2},
	on_use = minetest.item_eat(8, "farming:bowl")
})

minetest.register_craft({
	output = "farming:tomato_soup",
	recipe = {
		{"group:food_tomato"},
		{"group:food_tomato"},
		{"group:food_bowl"}
	}
})

-- tomato definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_tomato_1.png"},
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
minetest.register_node("hades_extrafarming:tomato_1", table.copy(def))

-- stage2
def.tiles = {"farming_tomato_2.png"}
minetest.register_node("hades_extrafarming:tomato_2", table.copy(def))

-- stage 3
def.tiles = {"farming_tomato_3.png"}
minetest.register_node("hades_extrafarming:tomato_3", table.copy(def))

-- stage 4
def.tiles = {"farming_tomato_4.png"}
minetest.register_node("hades_extrafarming:tomato_4", table.copy(def))

-- stage 5
def.tiles = {"farming_tomato_5.png"}
minetest.register_node("hades_extrafarming:tomato_5", table.copy(def))

-- stage 6
def.tiles = {"farming_tomato_6.png"}
minetest.register_node("hades_extrafarming:tomato_6", table.copy(def))

-- stage 7
def.tiles = {"farming_tomato_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:tomato"}, rarity = 1},
		{items = {"hades_extrafarming:tomato"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:tomato_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_tomato_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:tomato 3"}, rarity = 1},
		{items = {"hades_extrafarming:tomato 2"}, rarity = 2},
		{items = {"hades_extrafarming:tomato 1"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:tomato_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:tomato"] = {
	crop = "hades_extrafarming:tomato",
	seed = "hades_extrafarming:tomato",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- mapgen
--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.tomato,
		spread = {x = 100, y = 100, z = 100},
		seed = 365,
		octaves = 3,
		persist = 0.6
	},
	y_min = 5,
	y_max = 25,
	decoration = "farming:tomato_7"
})
--]]
