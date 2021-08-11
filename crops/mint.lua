
local S = farming.intllib

-- mint seed
minetest.register_craftitem("hades_extrafarming:seed_mint", {
	description = S("Mint Seeds"),
	inventory_image = "farming_mint_seeds.png",
	groups = {seed = 2, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(
				itemstack, placer, pointed_thing, "hades_extrafarming:mint_1")
	end
})

-- mint leaf
minetest.register_craftitem("hades_extrafarming:mint_leaf", {
	description = S("Mint Leaf"),
	inventory_image = "farming_mint_leaf.png",
	groups = {food_mint = 1, flammable = 4}
})

-- mint tea
minetest.register_craftitem("hades_extrafarming:mint_tea", {
	description = S("Mint Tea"),
	inventory_image = "farming_mint_tea.png",
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	groups = {flammable = 4, food = 3, eatable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:mint_tea",
	type = "shapeless",
	recipe = {
		"vessels:drinking_glass", "group:food_mint",
		"group:food_mint", "group:food_mint",
		"hades_extrafarming:juicer", "group:water_bucket"
	},
	replacements = {
		{"group:food_juicer", "hades_extrafarming:juicer"},
		{"group:water_bucket", "hades_bucket:bucket_empty"}
	}
})

if minetest.get_modpath("bucket_wooden") then
	minetest.register_craft({
		output = "hades_extrafarming:mint_tea",
		type = "shapeless",
		recipe = {
			"vessels:drinking_glass", "group:food_mint",
			"group:food_mint", "group:food_mint",
			"hades_extrafarming:juicer", "group:water_bucket_wooden"
		},
		replacements = {
			{"group:food_juicer", "hades_extrafarming:juicer"},
			{"group:water_bucket_wooden", "bucket_wooden:bucket_empty"}
		}
	})
end

-- mint definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_mint_1.png"},
	paramtype = "light",
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
minetest.register_node("hades_extrafarming:mint_1", table.copy(def))

-- stage 2
def.tiles = {"farming_mint_2.png"}
minetest.register_node("hades_extrafarming:mint_2", table.copy(def))

-- stage 3
def.tiles = {"farming_mint_3.png"}
minetest.register_node("hades_extrafarming:mint_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_mint_4.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:mint_leaf 2"}, rarity = 1},
		{items = {"hades_extrafarming:mint_leaf 2"}, rarity = 2},
		{items = {"hades_extrafarming:seed_mint 1"}, rarity = 1},
		{items = {"hades_extrafarming:seed_mint 2"}, rarity = 2},
	}
}
minetest.register_node("hades_extrafarming:mint_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:mint"] = {
	crop = "hades_extrafarming:mint",
	seed = "hades_extrafarming:seed_mint",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}
