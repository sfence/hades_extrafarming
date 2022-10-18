local S = farming.intllib

-- parsley seeds
minetest.register_node("hades_extrafarming:seed_parsley", {
	description = S("Parsley Seed"),
	tiles = {"farming_parsley_seed.png"},
	inventory_image = "farming_parsley_seed.png",
	wield_image = "farming_parsley_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:parsley_1")
	end,
})

-- item definition
minetest.register_craftitem("hades_extrafarming:parsley", {
	description = S("Parsley"),
	inventory_image = "farming_parsley.png",
	groups = {seed = 2, food_parsley = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:parsley_1")
	end
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_parsley_1.png"},
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
minetest.register_node("hades_extrafarming:parsley_1", table.copy(def))

-- stage 2
def.tiles = {"farming_parsley_2.png"}
minetest.register_node("hades_extrafarming:parsley_2", table.copy(def))

-- stage 3 (final)
def.tiles = {"farming_parsley_3.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:parsley 2"}, rarity = 1},
		{items = {"hades_extrafarming:parsley"}, rarity = 2},
		{items = {"hades_extrafarming:parsley"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:parsley_3", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:parsley"] = {
	crop = "hades_extrafarming:parsley",
	seed = "hades_extrafarming:parsley",
	minlight = 13,
	maxlight = 15,
	steps = 3
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.parsley,
		spread = {x = 100, y = 100, z = 100},
		seed = 23,
		octaves = 3,
		persist = 0.6
	},
	y_min = 10,
	y_max = 40,
	decoration = "farming:parsley_3"
})
