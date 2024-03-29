
local S = farming.intllib

--[[
-- wild cotton as a source of cotton seed and a chance of cotton itself
minetest.register_node("hades_extrafarming:cotton_wild", {
	description = S("Wild Cotton"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"farming_cotton_wild.png"},
	inventory_image = "farming_cotton_wild.png",
	wield_image = "farming_cotton_wild.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, flammable = 4},
	drop = {
		items = {
			{items = {"hades_extrafarming:cotton"}, rarity = 2},
			{items = {"hades_extrafarming:seed_cotton"}, rarity = 1}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -8 / 16, -6 / 16, 6 / 16, 5 / 16, 6 / 16}
	}
})

-- cotton seeds
minetest.register_node("hades_extrafarming:seed_cotton", {
	description = S("Cotton Seed"),
	tiles = {"farming_cotton_seed.png"},
	inventory_image = "farming_cotton_seed.png",
	wield_image = "farming_cotton_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:cotton_1")
	end
})
--]]

-- cotton
minetest.register_craftitem("hades_extrafarming:cotton", {
	description = S("Cotton"),
	inventory_image = "farming_cotton.png",
	groups = {flammable = 4}
})

-- string
--[[
minetest.register_craftitem("hades_extrafarming:string", {
	description = S("String"),
	inventory_image = "farming_string.png",
	groups = {flammable = 2}
})
--]]
minetest.register_alias("hades_extrafarming:string", "hades_farming:cotton");

-- cotton to wool
minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"hades_extrafarming:cotton", "hades_extrafarming:cotton"},
		{"hades_extrafarming:cotton", "hades_extrafarming:cotton"}
	}
})

-- cotton to string
minetest.register_craft({
	output = "hades_extrafarming:string 2",
	recipe = {
		{"hades_extrafarming:cotton"},
		{"hades_extrafarming:cotton"}
	}
})

-- can be used as fuel
--[[
minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:string",
	burntime = 1
})
--]]

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:cotton",
	burntime = 1
})

--[[
-- cotton definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_cotton_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:cotton_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cotton_2.png"}
minetest.register_node("hades_extrafarming:cotton_2", table.copy(def))

-- stage 3
def.tiles = {"farming_cotton_3.png"}
minetest.register_node("hades_extrafarming:cotton_3", table.copy(def))

-- stage 4
def.tiles = {"farming_cotton_4.png"}
minetest.register_node("hades_extrafarming:cotton_4", table.copy(def))

-- stage 5
def.tiles = {"farming_cotton_5.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 1}
	}
}
minetest.register_node("hades_extrafarming:cotton_5", table.copy(def))

-- stage 6
def.tiles = {"farming_cotton_6.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:cotton"}, rarity = 1},
		{items = {"hades_extrafarming:cotton"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:cotton_6", table.copy(def))

-- stage 7
def.tiles = {"farming_cotton_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:cotton"}, rarity = 1},
		{items = {"hades_extrafarming:cotton"}, rarity = 2},
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 1},
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:cotton_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_cotton_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:cotton"}, rarity = 1},
		{items = {"hades_extrafarming:cotton"}, rarity = 2},
		{items = {"hades_extrafarming:cotton"}, rarity = 3},
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 1},
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 2},
		{items = {"hades_extrafarming:seed_cotton"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:cotton_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:cotton"] = {
	crop = "hades_extrafarming:cotton",
	seed = "hades_extrafarming:seed_cotton",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
--]]

for i = 1,3 do
	local plant_name = "hades_farming:cotton_"..i;
	local new_drop = table.copy(minetest.registered_nodes[plant_name].drop)

	for index, data in pairs(new_drop.items) do
		if (data.items[1]=="hades_farming:cotton") then
			new_drop.items[index].items[1] = "hades_extrafarming:cotton"
		end
	end

	minetest.override_item(plant_name, {drop = new_drop})
end

minetest.clear_craft({
	--output = "wool:white",
	recipe = {
		{"hades_farming:cotton", "hades_farming:cotton"},
		{"hades_farming:cotton", "hades_farming:cotton"}
	}
})


--[[ Cotton using api
farming.register_plant("hades_extrafarming:cotton", {
	description = "Cotton seed",
	inventory_image = "farming_cotton_seed.png",
	groups = {flammable = 2},
	steps = 8,
})]]

-- mapgen
--[[
local mg = farming.mapgen == "v6"

def = {
	grow_on = mg and {"default:dirt_with_grass"} or {"default:dry_dirt_with_dry_grass"},
	biome = mg and {"jungle"} or {"savanna"}
}

minetest.register_decoration({
	name = "farming:cotton_wild",
	deco_type = "simple",
	place_on = def.grow_on,
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = def.biome,
	y_max = 31000,
	y_min = 1,
	decoration = "farming:cotton_wild"
})
--]]
