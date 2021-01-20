
local S = farming.intllib

-- raspberries seeds
minetest.register_node("hades_extrafarming:seed_raspberry", {
	description = S("Raspberry Seed"),
	tiles = {"farming_raspberry_seed.png"},
	inventory_image = "farming_raspberry_seed.png",
	wield_image = "farming_raspberry_seedd.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:raspberry_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_raspberry",
	recipe = {"group:food_raspberries"}
})

-- raspberries
minetest.register_craftitem("hades_extrafarming:raspberries", {
	description = S("Raspberries"),
	inventory_image = "farming_raspberries.png",
	groups = {food_raspberries = 1, food_raspberry = 1,
			food_berry = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1)
})

-- raspberry smoothie
minetest.register_craftitem("hades_extrafarming:smoothie_raspberry", {
	description = S("Raspberry Smoothie"),
	inventory_image = "farming_raspberry_smoothie.png",
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1, food = 3, eatable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:smoothie_raspberry",
	recipe = {
		{"default:snow"},
		{"group:food_raspberries"},
		{"vessels:drinking_glass"}
	}
})

-- raspberries definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_raspberry_1.png"},
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
minetest.register_node("hades_extrafarming:raspberry_1", table.copy(def))

-- stage 2
def.tiles = {"farming_raspberry_2.png"}
minetest.register_node("hades_extrafarming:raspberry_2", table.copy(def))

-- stage 3
def.tiles = {"farming_raspberry_3.png"}
minetest.register_node("hades_extrafarming:raspberry_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_raspberry_4.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:raspberries 2"}, rarity = 1},
		{items = {"hades_extrafarming:raspberries"}, rarity = 2},
		{items = {"hades_extrafarming:raspberries"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:raspberry_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:raspberries"] = {
	crop = "hades_extrafarming:raspberry",
	seed = "hades_extrafarming:raspberries",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}
