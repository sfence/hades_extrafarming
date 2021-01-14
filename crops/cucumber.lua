
--[[
	Original textures from DocFarming mod
	https://forum.minetest.net/viewtopic.php?id=3948
]]

local S = farming.intllib

-- cucumber
minetest.register_craftitem("hades_extrafarming:cucumber", {
	description = S("Cucumber"),
	inventory_image = "farming_cucumber.png",
	groups = {seed = 2, food_cucumber = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:cucumber_1")
	end,
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
	seed = "hades_extrafarming:cucumber",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}
