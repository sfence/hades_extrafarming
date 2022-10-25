
--[[
	Original textures from GeMinecraft
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/wip-mods/1440575-1-2-5-generation-minecraft-beta-1-2-farming-and
]]

local S = farming.intllib

-- corn seeds
minetest.register_node("hades_extrafarming:seed_corn", {
	description = S("Corn Seeds"),
	tiles = {"farming_corn_seed.png"},
	inventory_image = "farming_corn_seed.png",
	wield_image = "farming_corn_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:corn_1")
	end
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_corn",
	recipe = {"group:food_corn"}
})

-- corn
minetest.register_craftitem("hades_extrafarming:corn", {
	description = S("Corn"),
	inventory_image = "farming_corn.png",
	groups = {food_corn = 1, flammable = 2, food = 2, eatable = 3},
	on_use = minetest.item_eat(3)
})

-- corn on the cob (texture by TenPlus1)
minetest.register_craftitem("hades_extrafarming:corn_cob", {
	description = S("Corn on the Cob"),
	inventory_image = "farming_corn_cob.png",
	groups = {food_corn_cooked = 1, flammable = 2, food = 2, eatable = 5},
	on_use = minetest.item_eat(5)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_extrafarming:corn_cob",
	recipe = "group:food_corn"
})

-- popcorn
minetest.register_craftitem("hades_extrafarming:popcorn", {
	description = S("Popcorn"),
	inventory_image = "farming_popcorn.png",
	groups = {food_popcorn = 1, flammable = 2, eatable = 4},
	on_use = minetest.item_eat(4)
})

minetest.register_craft({
	output = "hades_extrafarming:popcorn",
	recipe = {
		{"group:food_pot", "group:food_oil", "group:food_corn"}
	},
	replacements = {
		{"group:food_pot", "hades_extrafarming:pot"},
		{"group:food_oil", "hades_vessels:glass_bottle"}
	}
})

-- cornstarch
minetest.register_craftitem("hades_extrafarming:cornstarch", {
	description = S("Cornstarch"),
	inventory_image = "farming_cornstarch.png",
	groups = {food_cornstarch = 1, food_gelatin = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:cornstarch",
	recipe = {
		{"group:food_mortar_pestle", "group:food_corn_cooked", "group:food_baking_tray"},
		{"", "group:food_bowl", ""},
	},
	replacements = {
		{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"},
		{"group:food_baking_tray", "hades_extrafarming:baking_tray"}
	}
})

-- ethanol (thanks to JKMurray for this idea)
minetest.register_node("hades_extrafarming:bottle_ethanol", {
	description = S("Bottle of Ethanol"),
	drawtype = "plantlike",
	tiles = {"farming_bottle_ethanol.png"},
	inventory_image = "farming_bottle_ethanol.png",
	wield_image = "farming_bottle_ethanol.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = hades_sounds.node_sound_glass_defaults()
})

minetest.register_craft( {
	output = "hades_extrafarming:bottle_ethanol",
	recipe = {
		{"group:food_corn", "group:food_corn", "group:food_corn"},
		{"group:food_corn", "hades_vessels:glass_bottle", "group:food_corn"},
		{"group:food_corn", "group:food_corn", "group:food_corn"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:bottle_ethanol",
	burntime = 80,
	replacements = {{"hades_extrafarming:bottle_ethanol", "hades_vessels:glass_bottle"}}
})

-- corn definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_corn_1.png"},
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
minetest.register_node("hades_extrafarming:corn_1", table.copy(def))

-- stage 2
def.tiles = {"farming_corn_2.png"}
minetest.register_node("hades_extrafarming:corn_2", table.copy(def))

-- stage 3
def.tiles = {"farming_corn_3.png"}
minetest.register_node("hades_extrafarming:corn_3", table.copy(def))

-- stage 4
def.tiles = {"farming_corn_4.png"}
minetest.register_node("hades_extrafarming:corn_4", table.copy(def))

-- stage 5
def.tiles = {"farming_corn_5.png"}
minetest.register_node("hades_extrafarming:corn_5", table.copy(def))

-- stage 6
def.tiles = {"farming_corn_6.png"}
def.visual_scale = 1.9
minetest.register_node("hades_extrafarming:corn_6", table.copy(def))

-- stage 7
def.tiles = {"farming_corn_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:corn"}, rarity = 1},
		{items = {"hades_extrafarming:corn"}, rarity = 2},
		{items = {"hades_extrafarming:corn"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:corn_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_corn_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:corn 2"}, rarity = 1},
		{items = {"hades_extrafarming:corn 2"}, rarity = 2},
		{items = {"hades_extrafarming:corn 2"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:corn_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:corn"] = {
	crop = "hades_extrafarming:corn",
	seed = "hades_extrafarming:seed_corn",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- mapgen
--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.corn,
		spread = {x = 100, y = 100, z = 100},
		seed = 134,
		octaves = 3,
		persist = 0.6
	},
	y_min = 12,
	y_max = 25,
	decoration = "farming:corn_7"
})
--]]
