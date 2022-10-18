
local S = farming.intllib

-- cabbage seed
minetest.register_node("hades_extrafarming:seed_cabbage", {
	description = S("Cabbage Seed"),
	tiles = {"farming_cabbage_seed.png"},
	inventory_image = "farming_cabbage_seed.png",
	wield_image = "farming_cabbage_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:cabbage_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_cabbage",
	recipe = {"group:food_cabbage"}
})

-- cabbage
minetest.register_craftitem("hades_extrafarming:cabbage", {
	description = S("Cabbage"),
	inventory_image = "farming_cabbage.png",
	groups = {food_cabbage = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_cabbage_1.png"},
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
minetest.register_node("hades_extrafarming:cabbage_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cabbage_2.png"}
minetest.register_node("hades_extrafarming:cabbage_2", table.copy(def))

-- stage 3
def.tiles = {"farming_cabbage_3.png"}
minetest.register_node("hades_extrafarming:cabbage_3", table.copy(def))

-- stage 4
def.tiles = {"farming_cabbage_4.png"}
minetest.register_node("hades_extrafarming:cabbage_4", table.copy(def))

-- stage 5
def.tiles = {"farming_cabbage_5.png"}
minetest.register_node("hades_extrafarming:cabbage_5", table.copy(def))

-- stage 6
def.tiles = {"farming_cabbage_6.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	max_items = 2, items = {
		{items = {"hades_extrafarming:cabbage 2"}, rarity = 1},
		{items = {"hades_extrafarming:cabbage 1"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:cabbage_6", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:cabbage"] = {
	crop = "hades_extrafarming:cabbage",
	seed = "hades_extrafarming:seed_cabbage",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 6
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.cabbage,
		spread = {x = 100, y = 100, z = 100},
		seed = 789,
		octaves = 3,
		persist = 0.6
	},
	y_min = 2,
	y_max = 15,
	decoration = "farming:cabbage_6"
})
