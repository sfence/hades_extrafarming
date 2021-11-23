local S = farming.intllib

-- artichoke seeds
minetest.register_node("hades_extrafarming:seed_artichoke", {
	description = S("Artichoke Seed"),
	tiles = {"farming_artichoke_seed.png"},
	inventory_image = "farming_artichoke_seed.png",
	wield_image = "farming_artichoke_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:artichoke_1")
	end,
})

-- item definition
minetest.register_craftitem("hades_extrafarming:artichoke", {
	description = S("Artichoke"),
	inventory_image = "farming_artichoke.png",
	groups = {seed = 2, food_artichoke = 1, flammable = 2, eatable = 4},
	on_use = minetest.item_eat(4)
})

minetest.register_craft({
	output = "hades_extrafarming:seed_artichoke",
	recipe = {{"hades_extrafarming:artichoke"}}
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_artichoke_1.png"},
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
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:artichoke_1", table.copy(def))

-- stage 2
def.tiles = {"farming_artichoke_2.png"}
minetest.register_node("hades_extrafarming:artichoke_2", table.copy(def))

-- stage 3
def.tiles = {"farming_artichoke_3.png"}
minetest.register_node("hades_extrafarming:artichoke_3", table.copy(def))

-- stage 4
def.tiles = {"farming_artichoke_4.png"}
minetest.register_node("hades_extrafarming:artichoke_4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_artichoke_5.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:artichoke 2"}, rarity = 1},
		{items = {"hades_extrafarming:artichoke"}, rarity = 2}
	}
}
minetest.register_node("hades_extrafarming:artichoke_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:artichoke"] = {
	crop = "hades_extrafarming:artichoke",
	seed = "hades_extrafarming:artichoke",
	minlight = 13,
	maxlight = 15,
	steps = 5
}
