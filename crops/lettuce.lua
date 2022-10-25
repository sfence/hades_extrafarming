local S = farming.intllib

-- lettuce seeds
minetest.register_node("hades_extrafarming:seed_lettuce", {
	description = S("Lettuce Seed"),
	tiles = {"farming_lettuce_seed.png"},
	inventory_image = "farming_lettuce_seed.png",
	wield_image = "farming_lettuce_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:lettuce_1")
	end,
})

-- lettuce
minetest.register_craftitem("hades_extrafarming:lettuce", {
	description = S("Lettuce"),
	inventory_image = "farming_lettuce.png",
	groups = {food_lettuce = 1, flammable = 2, food = 2, eatable = 2},
	groups = {seed = 2, food_lettuce = 1, flammable = 2},
	--[[
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:lettuce_1")
	end,
	--]]
	on_use = minetest.item_eat(2)
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_lettuce_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:lettuce_1", table.copy(def))

-- stage 2
def.tiles = {"farming_lettuce_2.png"}
minetest.register_node("hades_extrafarming:lettuce_2", table.copy(def))

-- stage 3
def.tiles = {"farming_lettuce_3.png"}
minetest.register_node("hades_extrafarming:lettuce_3", table.copy(def))

-- stage 4
def.tiles = {"farming_lettuce_4.png"}
minetest.register_node("hades_extrafarming:lettuce_4", table.copy(def))

-- stage 5
def.tiles = {"farming_lettuce_5.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {'hades_extrafarming:lettuce', "hades_extrafarming:seed_lettuce"}, rarity = 1},
		{items = {'hades_extrafarming:lettuce 1'}, rarity = 4},
		{items = {'hades_extrafarming:seed_lettuce 1'}, rarity = 4}
	}
}
minetest.register_node("hades_extrafarming:lettuce_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:lettuce"] = {
	crop = "hades_extrafarming:lettuce",
	seed = "hades_extrafarming:seed_lettuce",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}

-- mapgen
--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.lettuce,
		spread = {x = 100, y = 100, z = 100},
		seed = 689,
		octaves = 3,
		persist = 0.6
	},
	y_min = 5,
	y_max = 35,
	decoration = "farming:lettuce_5"
})
--]]
