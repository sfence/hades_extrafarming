
local S = farming.intllib

-- rice
minetest.register_craftitem("hades_extrafarming:rice", {
	description = S("Rice"),
	inventory_image = "farming_rice.png",
	groups = {seed = 2, food_rice = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:rice_1")
	end
})

-- replacement for rice seeds that was removed
minetest.register_alias("hades_extrafarming:seed_rice", "hades_extrafarming:rice")

minetest.register_craftitem("hades_extrafarming:rice_bread", {
	description = S("Rice Bread"),
	inventory_image = "farming_rice_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_rice_bread = 1, flammable = 2}
})

minetest.register_craftitem("hades_extrafarming:rice_flour", {
	description = S("Rice Flour"),
	inventory_image = "farming_rice_flour.png",
	groups = {food_rice_flour = 1, flammable = 1}
})

minetest.register_craft({
	output = "hades_extrafarming:rice_flour",
	recipe = {
		{"hades_extrafarming:rice", "hades_extrafarming:rice", "hades_extrafarming:rice"},
		{"hades_extrafarming:rice", "hades_extrafarming:mortar_pestle", ""}
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:rice_bread",
	recipe = "hades_extrafarming:rice_flour"
})

-- rice definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_rice_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:rice_1", table.copy(def))

-- stage 2
def.tiles = {"farming_rice_2.png"}
minetest.register_node("hades_extrafarming:rice_2", table.copy(def))

-- stage 3
def.tiles = {"farming_rice_3.png"}
minetest.register_node("hades_extrafarming:rice_3", table.copy(def))

-- stage 4
def.tiles = {"farming_rice_4.png"}
minetest.register_node("hades_extrafarming:rice_4", table.copy(def))

-- stage 5
def.tiles = {"farming_rice_5.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:rice"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:rice_5", table.copy(def))

-- stage 6
def.tiles = {"farming_rice_6.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:rice"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:rice_6", table.copy(def))

-- stage 7
def.tiles = {"farming_rice_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:rice"}, rarity = 1},
		{items = {"hades_extrafarming:rice"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:rice_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_rice_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:rice 2"}, rarity = 1},
		{items = {"hades_extrafarming:rice"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:rice_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:rice"] = {
	crop = "hades_extrafarming:rice",
	seed = "hades_extrafarming:rice",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- fuels
minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:rice",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:rice_bread",
	burntime = 1
})
