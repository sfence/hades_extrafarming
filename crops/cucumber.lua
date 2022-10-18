
--[[
	Original textures from DocFarming mod
	https://forum.minetest.net/viewtopic.php?id=3948
]]

local S = farming.intllib

-- cucumber seed
minetest.register_node("hades_extrafarming:seed_cucumber", {
	description = S("Cucumber Seed"),
	tiles = {"farming_cucumber_seed.png"},
	inventory_image = "farming_cucumber_seed.png",
	wield_image = "farming_cucumber_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:cucumber_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_cucumber",
	recipe = {"group:food_cucumber"}
})

-- cucumber
minetest.register_craftitem("hades_extrafarming:cucumber", {
	description = S("Cucumber"),
	inventory_image = "farming_cucumber.png",
	groups = {food_cucumber = 1, flammable = 2, food = 2, eatable = 4},
	on_use = minetest.item_eat(4)
})

-- cucumber definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_cucumber_1.png"},
	paramtype = "light",
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
minetest.register_node("hades_extrafarming:cucumber_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cucumber_2.png"}
minetest.register_node("hades_extrafarming:cucumber_2", table.copy(def))

-- stage 3
def.tiles = {"farming_cucumber_3.png"}
minetest.register_node("hades_extrafarming:cucumber_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_cucumber_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:cucumber 2"}, rarity = 1},
		{items = {"hades_extrafarming:cucumber 2"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:cucumber_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:cucumber"] = {
	crop = "hades_extrafarming:cucumber",
	seed = "hades_extrafarming:seed_cucumber",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}

-- mapgen
local mg = farming.mapgen == "v6"

def = {
	near = mg and "group:water" or nil,
	num = mg and 1 or -1,
}

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.cucumber,
		spread = {x = 100, y = 100, z = 100},
		seed = 245,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 20,
	decoration = "farming:cucumber_4",
	spawn_by = def.near,
	num_spawn_by = def.num
})
