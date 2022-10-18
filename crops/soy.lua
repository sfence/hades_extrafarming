
local S = farming.intllib

-- soy seeds
minetest.register_node("hades_extrafarming:seed_soy", {
	description = S("Soy Seed"),
	tiles = {"farming_soy_seed.png"},
	inventory_image = "farming_soy_seed.png",
	wield_image = "farming_soy_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
-- soy pod
minetest.register_craftitem("hades_extrafarming:soy_pod", {
	description = S("Soy Pod"),
	inventory_image = "farming_soy_pod.png",
	groups = {food_soy_pod = 1, food_soy, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_soy",
	recipe = {"hades_extrafarming:soy_beans"},
})

-- replacement for soy beans that was removed
minetest.register_alias("hades_extrafarming:soy_beans", "hades_extrafarming:soy_pod")

-- soy sauce
minetest.register_node("hades_extrafarming:soy_sauce", {
	description = S("Soy Sauce"),
	drawtype = "plantlike",
	tiles = {"farming_soy_sauce.png"},
	inventory_image = "farming_soy_sauce.png",
	wield_image = "farming_soy_sauce.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {
		vessel = 1, food_soy_sauce = 1, dig_immediate = 3, attached_node = 1
	},
	sounds = hades_sounds.node_sound_glass_defaults()
})

-- soy sauce recipe
minetest.register_craft( {
	output = "hades_extrafarming:soy_sauce",
	recipe = {
		{"group:food_soy", "group:food_salt", "group:food_soy"},
		{"", "group:food_juicer", ""},
		{"", "hades_bucket:bucket_water", "hades_vessels:glass_bottle"}
	},
	replacements = {
		{"hades_bucket:bucket_water", "hades_bucket:bucket_empty"},
		{"group:food_juicer", "hades_extrafarming:juicer"}
	}
})

-- soy milk
minetest.register_node("hades_extrafarming:soy_milk", {
	description = S("Soy Milk"),
	drawtype = "plantlike",
	tiles = {"farming_soy_milk_glass.png"},
	inventory_image = "farming_soy_milk_glass.png",
	wield_image = "farming_soy_milk_glass.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	on_use = minetest.item_eat(2, "hades_vessels:drinking_glass"),
	groups = {
		vessel = 1, food_milk_glass = 1, dig_immediate = 3,
		attached_node = 1, drink = 1, food = 3, eatable = 2
	},
	sounds = hades_sounds.node_sound_glass_defaults()
})

minetest.register_craft( {
	output = "hades_extrafarming:soy_milk",
	recipe = {
		{"group:food_soy", "group:food_soy", "group:food_soy"},
		{"hades_extrafarming:vanilla_extract", "hades_bucket:bucket_water", "hades_vessels:drinking_glass"}
	},
	replacements = {
		{"hades_bucket:bucket_water", "hades_bucket:bucket_empty"},
		{"hades_extrafarming:vanilla_extract", "hades_vessels:glass_bottle"}
	}
})

-- tofu
minetest.register_craftitem("hades_extrafarming:tofu", {
	description = S("Tofu"),
	inventory_image = "farming_tofu.png",
	groups = {food_tofu = 1, food_meat_raw = 1, flammable = 2, food = 2, eatable = 3},
	on_use = minetest.item_eat(3)
})

minetest.register_craft({
	output = "hades_extrafarming:tofu",
	recipe = {
		{"hades_extrafarming:baking_tray", "group:food_soy", "group:food_soy"},
		{"group:food_soy", "group:food_soy", "group:food_soy"}
	},
	replacements = {{"hades_extrafarming:baking_tray", "hades_extrafarming:baking_tray"}}
})

-- cooked tofu
minetest.register_craftitem("hades_extrafarming:tofu_cooked", {
	description = S("Cooked Tofu"),
	inventory_image = "farming_tofu_cooked.png",
	groups = {food_meat = 1, flammable = 2, food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	type = "cooking",
	output = "hades_extrafarming:tofu_cooked",
	recipe = "hades_extrafarming:tofu",
	cooktime = 5
})

-- crop definition

local def = {
	drawtype = "plantlike",
	tiles = {"farming_soy_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
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
minetest.register_node("hades_extrafarming:soy_1", table.copy(def))

-- stage 2
def.tiles = {"farming_soy_2.png"}
minetest.register_node("hades_extrafarming:soy_2", table.copy(def))

-- stage 3
def.tiles = {"farming_soy_3.png"}
minetest.register_node("hades_extrafarming:soy_3", table.copy(def))

-- stage 4
def.tiles = {"farming_soy_4.png"}
minetest.register_node("hades_extrafarming:soy_4", table.copy(def))

-- stage 5
def.tiles = {"farming_soy_5.png"}
def.drop = {
	max_items = 1, items = {
		{items = {'hades_extrafarming:soy_pod'}, rarity = 1},
	}
}
minetest.register_node("hades_extrafarming:soy_5", table.copy(def))

-- stage 6
def.tiles = {"farming_soy_6.png"}
def.drop = {
	max_items = 3, items = {
		{items = {'hades_extrafarming:soy_pod'}, rarity = 1},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 2},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 3},
	}
}
minetest.register_node("hades_extrafarming:soy_6", table.copy(def))

-- stage 7
def.tiles = {"farming_soy_7.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	max_items = 5, items = {
		{items = {'hades_extrafarming:soy_pod'}, rarity = 1},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 2},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 3},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 4},
		{items = {'hades_extrafarming:soy_pod'}, rarity = 5}
	}
}
minetest.register_node("hades_extrafarming:soy_7", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:soy_pod"] = {
	crop = "hades_extrafarming:soy",
	seed = "hades_extrafarming:seed_soy",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 7
}

-- mapgen
local mg = farming.mapgen == "v6"

def = {
	spawn_on = mg and {"default:dirt_with_grass"} or {"default:dirt_with_dry_grass",
			"default:dirt_with_rainforest_litter", "default:dry_dirt_with_dry_grass"}
}

minetest.register_decoration({
	deco_type = "simple",
	place_on = def.spawn_on,
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.soy,
		spread = {x = 100, y = 100, z = 100},
		seed = 809,
		octaves = 3,
		persist = 0.6
	},
	y_min = 20,
	y_max = 50,
	decoration = "farming:soy_6"
})
