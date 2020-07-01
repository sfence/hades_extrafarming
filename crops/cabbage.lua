
local S = farming.intllib

-- cabbage
minetest.register_craftitem("farming:cabbage", {
	description = S("Cabbage"),
	inventory_image = "farming_cabbage.png",
	groups = {seed = 2, food_cabbage = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:cabbage_1")
	end,
	on_use = minetest.item_eat(1),
})

local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_cabbage_1.png"},
	paramtype = "light",
--	paramtype2 = "meshoptions",
--	place_param2 = 3,
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
minetest.register_node("farming:cabbage_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_cabbage_2.png"}
minetest.register_node("farming:cabbage_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_cabbage_3.png"}
minetest.register_node("farming:cabbage_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_cabbage_4.png"}
minetest.register_node("farming:cabbage_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_cabbage_5.png"}
minetest.register_node("farming:cabbage_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_cabbage_6.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	max_items = 2, items = {
		{items = {"farming:cabbage"}, rarity = 1},
		{items = {"farming:cabbage"}, rarity = 4},
	}
}
minetest.register_node("farming:cabbage_6", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:cabbage"] = {
	crop = "farming:cababge",
	seed = "farming:cabbage",
	minlight = 13,
	maxlight = 15,
	steps = 6
}
