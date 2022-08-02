
local S = farming.intllib

-- hemp seeds
minetest.register_node("hades_extrafarming:seed_hemp", {
	description = S("Hemp Seed"),
	tiles = {"farming_hemp_seed.png"},
	inventory_image = "farming_hemp_seed.png",
	wield_image = "farming_hemp_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:hemp_1")
	end
})

-- harvested hemp
minetest.register_craftitem("hades_extrafarming:hemp_leaf", {
	description = S("Hemp Leaf"),
	inventory_image = "farming_hemp_leaf.png"
})

-- hemp oil
minetest.register_node("hades_extrafarming:hemp_oil", {
	description = S("Bottle of Hemp Oil"),
	drawtype = "plantlike",
	tiles = {"farming_hemp_oil.png"},
	inventory_image = "farming_hemp_oil.png",
	wield_image = "farming_hemp_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {food_oil = 1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = hades_sounds.node_sound_glass_defaults()
})

minetest.register_craft( {
	output = "hades_extrafarming:hemp_oil",
	recipe = {
		{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"},
		{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"},
		{"", "hades_vessels:glass_bottle", ""}
	}
})

minetest.register_craft( {
	output = "hades_extrafarming:hemp_oil",
	recipe = {
		{"hades_extrafarming:seed_hemp", "hades_extrafarming:seed_hemp", "hades_extrafarming:seed_hemp"},
		{"hades_extrafarming:seed_hemp", "hades_extrafarming:seed_hemp", "hades_extrafarming:seed_hemp"},
		{"hades_extrafarming:seed_hemp", "hades_vessels:glass_bottle", "hades_extrafarming:seed_hemp"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:hemp_oil",
	burntime = 20,
	replacements = {{"hades_extrafarming:hemp_oil", "hades_vessels:glass_bottle"}}
})

-- hemp fibre
minetest.register_craftitem("hades_extrafarming:hemp_fibre", {
	description = S("Hemp Fibre"),
	inventory_image = "farming_hemp_fibre.png"
})

minetest.register_craft( {
	output = "hades_extrafarming:hemp_fibre 8",
	recipe = {
		{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"},
		{"hades_extrafarming:hemp_leaf", "group:water_bucket", "hades_extrafarming:hemp_leaf"},
		{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"}
	},
	replacements = {{"group:water_bucket", "hades_bucket:bucket_empty"}}
})

if minetest.get_modpath("bucket_wooden") then
	minetest.register_craft( {
		output = "hades_extrafarming:hemp_fibre 8",
		recipe = {
			{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"},
			{"hades_extrafarming:hemp_leaf", "group:water_bucket_wooden", "hades_extrafarming:hemp_leaf"},
			{"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_leaf"}
		},
		replacements = {{"group:water_bucket_wooden", "bucket_wooden:bucket_empty"}}
	})
end

-- hemp block
minetest.register_node("hades_extrafarming:hemp_block", {
	description = S("Hemp Block"),
	tiles = {"farming_hemp_block.png"},
	paramtype = "light",
	groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2}
})

minetest.register_craft( {
	output = "hades_extrafarming:hemp_block",
	recipe = {
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"}
	}
})

-- check and register stairs
if minetest.global_exists("stairs") then

	if stairs.mod and stairs.mod == "redo" then

		stairs.register_all("hemp_block", "hades_extrafarming:hemp_block",
			{snappy = 1, flammable = 2},
			{"farming_hemp_block.png"},
			"Hemp Block",
			hades_sounds.node_sound_leaves_defaults())
	else

		stairs.register_stair_and_slab("hemp_block", "hades_extrafarming:hemp_block",
			{snappy = 1, flammable = 2},
			{"farming_hemp_block.png"},
			"Hemp Block Stair",
			"Outer Hemp Block Stair",
			"Inner Hemp Block Stair",
			"Hemp Block Slab",
			hades_sounds.node_sound_leaves_defaults())
	end
end

-- paper
minetest.register_craft( {
	output = "default:paper 3",
	recipe = {
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"}
	}
})

-- string
minetest.register_craft( {
	output = "hades_extrafarming:cotton 3",
	recipe = {
		{"hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:hemp_fibre"}
	}
})

-- hemp rope
minetest.register_node("hades_extrafarming:hemp_rope", {
	description = S("Hemp Rope"),
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	tiles = {"farming_hemp_rope.png"},
	wield_image = "farming_hemp_rope.png",
	inventory_image = "farming_hemp_rope.png",
	drawtype = "plantlike",
	groups = {flammable = 2, choppy = 3, oddly_breakable_by_hand = 3},
	sounds =  hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7}
	}
})

-- string
minetest.register_craft( {
	output = "hades_extrafarming:hemp_rope 6",
	recipe = {
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:cotton", "hades_extrafarming:cotton", "hades_extrafarming:cotton"},
		{"hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre", "hades_extrafarming:hemp_fibre"}
	}
})

-- hemp definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_hemp_1.png"},
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
minetest.register_node("hades_extrafarming:hemp_1", table.copy(def))

-- stage 2
def.tiles = {"farming_hemp_2.png"}
minetest.register_node("hades_extrafarming:hemp_2", table.copy(def))

-- stage 3
def.tiles = {"farming_hemp_3.png"}
minetest.register_node("hades_extrafarming:hemp_3", table.copy(def))

-- stage 4
def.tiles = {"farming_hemp_4.png"}
minetest.register_node("hades_extrafarming:hemp_4", table.copy(def))

-- stage 5
def.tiles = {"farming_hemp_5.png"}
minetest.register_node("hades_extrafarming:hemp_5", table.copy(def))

-- stage 6
def.tiles = {"farming_hemp_6.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:hemp_leaf"}, rarity = 2},
		{items = {"hades_extrafarming:seed_hemp"}, rarity = 1}
	}
}
minetest.register_node("hades_extrafarming:hemp_6", table.copy(def))

-- stage 7
def.tiles = {"farming_hemp_7.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:hemp_leaf"}, rarity = 1},
		{items = {"hades_extrafarming:hemp_leaf"}, rarity = 3},
		{items = {"hades_extrafarming:seed_hemp"}, rarity = 1},
		{items = {"hades_extrafarming:seed_hemp"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:hemp_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_hemp_8.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:hemp_leaf 2"}, rarity = 1},
		{items = {"hades_extrafarming:hemp_leaf"}, rarity = 2},
		{items = {"hades_extrafarming:seed_hemp"}, rarity = 1},
		{items = {"hades_extrafarming:seed_hemp"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:hemp_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:hemp"] = {
	crop = "hades_extrafarming:hemp",
	seed = "hades_extrafarming:seed_hemp",
	mminlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}
