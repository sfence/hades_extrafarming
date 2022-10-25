
--[[
	Original textures from DocFarming mod
	https://forum.minetest.net/viewtopic.php?id=3948
]]

local S = farming.intllib

-- potato
minetest.register_craftitem("hades_extrafarming:potato", {
	description = S("Potato"),
	inventory_image = "farming_potato.png",
	groups = {seed = 2, food_potato = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:potato_1")
	end,
	-- 1 in 3 chance of being poisoned
	on_use = function(itemstack, user, pointed_thing)
		if user then
			if math.random(3) == 1 then
				return minetest.do_item_eat(-1, nil, itemstack, user, pointed_thing)
			else
				return minetest.do_item_eat(1, nil, itemstack, user, pointed_thing)
			end
		end
	end
})

-- baked potato
minetest.register_craftitem("hades_extrafarming:baked_potato", {
	description = S("Baked Potato"),
	inventory_image = "farming_baked_potato.png",
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_extrafarming:baked_potato",
	recipe = "group:food_potato"
})

-- Potato and cucumber Salad
minetest.register_craftitem("hades_extrafarming:potato_salad", {
	description = S("Cucumber and Potato Salad"),
	inventory_image = "farming_potato_salad.png",
	on_use = minetest.item_eat(10, "hades_extrafarming:bowl")
})

minetest.register_craft({
	output = "hades_extrafarming:potato_salad",
	recipe = {
		{"group:food_cucumber"},
		{"hades_extrafarming:baked_potato"},
		{"group:food_bowl"}
	}
})

-- potato definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_potato_1.png"},
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
minetest.register_node("hades_extrafarming:potato_1", table.copy(def))

-- stage 2
def.tiles = {"farming_potato_2.png"}
minetest.register_node("hades_extrafarming:potato_2", table.copy(def))

-- stage 3
def.tiles = {"farming_potato_3.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:potato"}, rarity = 1},
		{items = {"hades_extrafarming:potato"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:potato_3", table.copy(def))

-- stage 4
def.tiles = {"farming_potato_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:potato 2"}, rarity = 1},
		{items = {"hades_extrafarming:potato 3"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:potato_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:potato"] = {
	crop = "hades_extrafarming:potato",
	seed = "hades_extrafarming:potato",
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
		scale = farming.potato,
		spread = {x = 100, y = 100, z = 100},
		seed = 465,
		octaves = 3,
		persist = 0.6
	},
	y_min = 15,
	y_max = 40,
	decoration = "farming:potato_3"
})
--]]
