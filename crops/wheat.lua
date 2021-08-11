
local S = farming.intllib

--[[
-- wheat seeds
minetest.register_node("hades_extrafarming:seed_wheat", {
	description = S("Wheat Seed"),
	tiles = {"farming_wheat_seed.png"},
	inventory_image = "farming_wheat_seed.png",
	wield_image = "farming_wheat_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:wheat_1")
	end
})

-- harvested wheat
minetest.register_craftitem("hades_extrafarming:wheat", {
	description = S("Wheat"),
	inventory_image = "farming_wheat.png",
	groups = {food_wheat = 1, flammable = 4}
})

-- straw
minetest.register_node("hades_extrafarming:straw", {
	description = S("Straw"),
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 4, fall_damage_add_percent = -30},
	sounds = hades_sounds.node_sound_leaves_defaults()
})

minetest.register_craft({
	output = "hades_extrafarming:straw 3",
	recipe = {
		{"hades_extrafarming:wheat", "hades_extrafarming:wheat", "hades_extrafarming:wheat"},
		{"hades_extrafarming:wheat", "hades_extrafarming:wheat", "hades_extrafarming:wheat"},
		{"hades_extrafarming:wheat", "hades_extrafarming:wheat", "hades_extrafarming:wheat"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:wheat 3",
	recipe = {
		{"hades_extrafarming:straw"}
	}
})

-- check and register stairs
if minetest.global_exists("stairs") then

	if stairs.mod and stairs.mod == "redo" then

		stairs.register_all("straw", "hades_extrafarming:straw",
			{snappy = 3, flammable = 4},
			{"farming_straw.png"},
			"Straw",
			hades_sounds.node_sound_leaves_defaults())
	else

		stairs.register_stair_and_slab("straw", "hades_extrafarming:straw",
			{snappy = 3, flammable = 4},
			{"farming_straw.png"},
			"Straw Stair",
			"Straw Slab",
			hades_sounds.node_sound_leaves_defaults())
	end
end

-- flour
minetest.register_craftitem("hades_extrafarming:flour", {
	description = S("Flour"),
	inventory_image = "farming_flour.png",
	groups = {food_flour = 1, flammable = 1}
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:flour",
	recipe = {
		"hades_extrafarming:wheat", "hades_extrafarming:wheat", "hades_extrafarming:wheat",
		"hades_extrafarming:wheat", "hades_extrafarming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

-- bread
minetest.register_craftitem("hades_extrafarming:bread", {
	description = S("Bread"),
	inventory_image = "farming_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_bread = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:bread",
	recipe = "hades_extrafarming:flour"
})
--]]

-- sliced bread
minetest.register_craftitem("hades_extrafarming:bread_slice", {
	description = S("Sliced Bread"),
	inventory_image = "farming_bread_slice.png",
	on_use = minetest.item_eat(1),
	groups = {food_bread_slice = 1, flammable = 2, food = 2, eatable = 1}
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:bread_slice 5",
	recipe = {"hades_farming:bread", "group:food_cutting_board"},
	replacements = {{"group:food_cutting_board", "hades_extrafarming:cutting_board"}}
})

-- toast
minetest.register_craftitem("hades_extrafarming:toast", {
	description = S("Toast"),
	inventory_image = "farming_toast.png",
	on_use = minetest.item_eat(1),
	groups = {food_toast = 1, flammable = 2, food = 2, eatable = 1}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "hades_extrafarming:toast",
	recipe = "hades_extrafarming:bread_slice"
})

-- toast sandwich
minetest.register_craftitem("hades_extrafarming:toast_sandwich", {
	description = S("Toast Sandwich"),
	inventory_image = "farming_toast_sandwich.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, food = 2, eatable = 4}
})

minetest.register_craft({
	output = "hades_extrafarming:toast_sandwich",
	recipe = {
		{"hades_extrafarming:bread_slice"},
		{"hades_extrafarming:toast"},
		{"hades_extrafarming:bread_slice"}
	}
})

--[[
-- wheat definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_wheat_1.png"},
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
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:wheat_1", table.copy(def))

-- stage 2
def.tiles = {"farming_wheat_2.png"}
minetest.register_node("hades_extrafarming:wheat_2", table.copy(def))

-- stage 3
def.tiles = {"farming_wheat_3.png"}
minetest.register_node("hades_extrafarming:wheat_3", table.copy(def))

-- stage 4
def.tiles = {"farming_wheat_4.png"}
minetest.register_node("hades_extrafarming:wheat_4", table.copy(def))

-- stage 5
def.tiles = {"farming_wheat_5.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:wheat"}, rarity = 2},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:wheat_5", table.copy(def))

-- stage 6
def.tiles = {"farming_wheat_6.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:wheat"}, rarity = 2},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 1}
	}
}
minetest.register_node("hades_extrafarming:wheat_6", table.copy(def))

-- stage 7
def.tiles = {"farming_wheat_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:wheat"}, rarity = 1},
		{items = {"hades_extrafarming:wheat"}, rarity = 3},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 1},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:wheat_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_wheat_8.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:wheat"}, rarity = 1},
		{items = {"hades_extrafarming:wheat"}, rarity = 3},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 1},
		{items = {"hades_extrafarming:seed_wheat"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:wheat_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:wheat"] = {
	crop = "hades_extrafarming:wheat",
	seed = "hades_extrafarming:seed_wheat",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- fuels
minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:straw",
	burntime = 3
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:wheat",
	burntime = 1
})
--]]

