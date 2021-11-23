
local S = farming.intllib

-- melon seed
minetest.register_node("hades_extrafarming:seed_melon", {
	description = S("Melon Seed"),
	tiles = {"crops_melon_seed.png"},
	inventory_image = "crops_melon_seed.png",
	wield_image = "crops_melon_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:melon_1")
	end
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_melon",
	recipe = {"group:food_melon_slice"}
})

-- melon
minetest.register_craftitem("hades_extrafarming:melon_slice", {
	description = S("Melon Slice"),
	inventory_image = "farming_melon_slice.png",
	groups = {food_melon_slice = 1, flammable = 3, food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "hades_extrafarming:melon_8",
	recipe = {
		{"hades_extrafarming:melon_slice", "hades_extrafarming:melon_slice"},
		{"hades_extrafarming:melon_slice", "hades_extrafarming:melon_slice"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:melon_slice 4",
	recipe = {{"hades_extrafarming:cutting_board", "hades_extrafarming:melon_8"}},
	replacements = {{"hades_extrafarming:cutting_board", "hades_extrafarming:cutting_board"}}
})

-- melon definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_melon_1.png"},
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
minetest.register_node("hades_extrafarming:melon_1", table.copy(def))

-- stage 2
def.tiles = {"farming_melon_2.png"}
minetest.register_node("hades_extrafarming:melon_2", table.copy(def))

-- stage 3
def.tiles = {"farming_melon_3.png"}
minetest.register_node("hades_extrafarming:melon_3", table.copy(def))

-- stage 4
def.tiles = {"farming_melon_4.png"}
minetest.register_node("hades_extrafarming:melon_4", table.copy(def))

-- stage 5
def.tiles = {"farming_melon_5.png"}
minetest.register_node("hades_extrafarming:melon_5", table.copy(def))

-- stage 6
def.tiles = {"farming_melon_6.png"}
minetest.register_node("hades_extrafarming:melon_6", table.copy(def))

-- stage 7
def.tiles = {"farming_melon_7.png"}
minetest.register_node("hades_extrafarming:melon_7", table.copy(def))

-- stage 8 (final)
minetest.register_node("hades_extrafarming:melon_8", {
	description = S("Melon"),
	tiles = {
		"farming_melon_top.png",
		"farming_melon_bottom.png",
		"farming_melon_side.png"
	},
	groups = {
		food_melon = 1, snappy = 2, oddly_breakable_by_hand = 1,
		flammable = 2, plant = 1
	},
	drop = "hades_extrafarming:melon_8",
	sounds = hades_sounds.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node
})

-- add to registered_plants
farming.registered_plants["hades_extrafarming:melon"] = {
	crop = "hades_extrafarming:melon",
	seed = "hades_extrafarming:seed_melon",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
