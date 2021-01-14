
local S = farming.intllib

-- melon
minetest.register_craftitem("hades_extrafarming:melon_slice", {
	description = S("Melon Slice"),
	inventory_image = "farming_melon_slice.png",
	groups = {seed = 2, food_melon_slice = 1, flammable = 3},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:melon_1")
	end,
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
	type = "shapeless",
	output = "hades_extrafarming:melon_slice 4",
	recipe = {"hades_extrafarming:melon_8", "hades_extrafarming:cutting_board"},
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
def.drawtype = "nodebox"
def.description = S("Melon")
def.tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"}
def.selection_box = {-.5, -.5, -.5, .5, .5, .5}
def.walkable = true
def.groups = {
	food_melon = 1, snappy = 2, oddly_breakable_by_hand = 1,
	flammable = 2, plant = 1
}
def.drop = "hades_extrafarming:melon_8"
minetest.register_node("hades_extrafarming:melon_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:melon"] = {
	crop = "hades_extrafarming:melon",
	seed = "hades_extrafarming:melon_slice",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
