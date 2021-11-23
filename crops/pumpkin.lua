
--[[
	Big thanks to PainterlyPack.net for allowing me to use these textures
]]

local S = farming.intllib

-- pumpkin seed
minetest.register_node("hades_extrafarming:seed_pumpkin", {
	description = S("Pumpkin Seed"),
	tiles = {"crops_pumpkin_seed.png"},
	inventory_image = "crops_pumpkin_seed.png",
	wield_image = "crops_pumpkin_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:pumpkin_1")
	end
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_pumpkin",
	recipe = {"group:food_pumpkin_slice"}
})

-- pumpkin slice
minetest.register_craftitem("hades_extrafarming:pumpkin_slice", {
	description = S("Pumpkin Slice"),
	inventory_image = "farming_pumpkin_slice.png",
	groups = {food_pumpkin_slice = 1, flammable = 2, food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "hades_extrafarming:pumpkin",
	recipe = {
		{"hades_extrafarming:pumpkin_slice", "hades_extrafarming:pumpkin_slice"},
		{"hades_extrafarming:pumpkin_slice", "hades_extrafarming:pumpkin_slice"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:pumpkin_slice 4",
	recipe = {{"hades_extrafarming:cutting_board","hades_extrafarming:pumpkin"}},
	replacements = {{"hades_extrafarming:cutting_board", "hades_extrafarming:cutting_board"}}
})

-- jack 'o lantern
minetest.register_node("hades_extrafarming:jackolantern", {
	description = S("Jack 'O Lantern (punch to turn on and off)"),
	tiles = {
		"farming_pumpkin_top.png", "farming_pumpkin_top.png",
		"farming_pumpkin_side.png", "farming_pumpkin_side.png",
		"farming_pumpkin_side.png", "farming_pumpkin_face_off.png"
	},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = hades_sounds.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)
		local name = puncher:get_player_name() or ""
		if minetest.is_protected(pos, name) then return end
		node.name = "hades_extrafarming:jackolantern_on"
		minetest.swap_node(pos, node)
	end
})

minetest.register_node("hades_extrafarming:jackolantern_on", {
	tiles = {
		"farming_pumpkin_top.png", "farming_pumpkin_top.png",
		"farming_pumpkin_side.png", "farming_pumpkin_side.png",
		"farming_pumpkin_side.png", "farming_pumpkin_face_on.png"
	},
	light_source = minetest.LIGHT_MAX - 1,
	paramtype2 = "facedir",
	groups = {
		choppy = 1, oddly_breakable_by_hand = 1, flammable = 2,
		not_in_creative_inventory = 1
	},
	sounds = hades_sounds.node_sound_wood_defaults(),
	drop = "hades_extrafarming:jackolantern",
	on_punch = function(pos, node, puncher)
		local name = puncher:get_player_name() or ""
		if minetest.is_protected(pos, name) then return end
		node.name = "hades_extrafarming:jackolantern"
		minetest.swap_node(pos, node)
	end
})

minetest.register_craft({
	output = "hades_extrafarming:jackolantern",
	recipe = {
		{"hades_torches:torch"},
		{"group:food_pumpkin"}
	}
})

--- wooden scarecrow base
minetest.register_node("hades_extrafarming:scarecrow_bottom", {
	description = S("Scarecrow Bottom"),
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
			{-12/16, 4/16, -1/16, 12/16, 2/16, 1/16},
		}
	},
	groups = {snappy = 3, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:scarecrow_bottom",
	recipe = {
		{"", "group:stick", ""},
		{"group:stick", "group:stick", "group:stick"},
		{"", "group:stick", ""}
	}
})

-- pumpkin bread
minetest.register_craftitem("hades_extrafarming:pumpkin_bread", {
	description = S("Pumpkin Bread"),
	inventory_image = "farming_pumpkin_bread.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2, food = 2, eatable = 8}
})

minetest.register_craftitem("hades_extrafarming:pumpkin_dough", {
	description = S("Pumpkin Dough"),
	inventory_image = "farming_pumpkin_dough.png"
})

minetest.register_craft({
	output = "hades_extrafarming:pumpkin_dough",
	recipe = {
		{"group:food_pumpkin_slice", "group:food_flour", "group:food_pumpkin_slice"}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "hades_extrafarming:pumpkin_bread",
	recipe = "hades_extrafarming:pumpkin_dough",
	cooktime = 10
})

-- pumpkin definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_pumpkin_1.png"},
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
minetest.register_node("hades_extrafarming:pumpkin_1", table.copy(def))

-- stage 2
def.tiles = {"farming_pumpkin_2.png"}
minetest.register_node("hades_extrafarming:pumpkin_2", table.copy(def))

-- stage 3
def.tiles = {"farming_pumpkin_3.png"}
minetest.register_node("hades_extrafarming:pumpkin_3", table.copy(def))

-- stage 4
def.tiles = {"farming_pumpkin_4.png"}
minetest.register_node("hades_extrafarming:pumpkin_4", table.copy(def))

-- stage 5
def.tiles = {"farming_pumpkin_5.png"}
minetest.register_node("hades_extrafarming:pumpkin_5", table.copy(def))

-- stage 6
def.tiles = {"farming_pumpkin_6.png"}
minetest.register_node("hades_extrafarming:pumpkin_6", table.copy(def))

-- stage 7
def.tiles = {"farming_pumpkin_7.png"}
minetest.register_node("hades_extrafarming:pumpkin_7", table.copy(def))

-- stage 8 (final)
minetest.register_node("hades_extrafarming:pumpkin_8", {
	description = S("Pumpkin"),
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_bottom.png",
		"farming_pumpkin_side.png"
	},
	groups = {
		food_pumpkin = 1, choppy = 2, oddly_breakable_by_hand = 1,
		flammable = 2, plant = 1
	},
	drop = "hades_extrafarming:pumpkin_8",
	sounds = hades_sounds.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node
})

minetest.register_alias("hades_extrafarming:pumpkin", "hades_extrafarming:pumpkin_8")

-- add to registered_plants
farming.registered_plants["hades_extrafarming:pumpkin"] = {
	crop = "hades_extrafarming:pumpkin",
	seed = "hades_extrafarming:pumpkin_slice",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
