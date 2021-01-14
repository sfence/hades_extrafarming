local S = farming.intllib

-- lettuce
minetest.register_craftitem("hades_extrafarming:lettuce", {
	description = S("Lettuce"),
	inventory_image = "farming_lettuce.png",
	groups = {seed = 2, food_lettuce = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "hades_extrafarming:lettuce_1")
	end,
	on_use = minetest.item_eat(2),
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_lettuce_1.png"},
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
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:lettuce_1", table.copy(def))

-- stage 2
def.tiles = {"farming_lettuce_2.png"}
minetest.register_node("hades_extrafarming:lettuce_2", table.copy(def))

-- stage 3
def.tiles = {"farming_lettuce_3.png"}
minetest.register_node("hades_extrafarming:lettuce_3", table.copy(def))

-- stage 4
def.tiles = {"farming_lettuce_4.png"}
minetest.register_node("hades_extrafarming:lettuce_4", table.copy(def))

-- stage 5
def.tiles = {"farming_lettuce_5.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {'hades_extrafarming:lettuce 2'}, rarity = 1},
		{items = {'hades_extrafarming:lettuce 1'}, rarity = 2},
	}
}
minetest.register_node("hades_extrafarming:lettuce_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:lettuce"] = {
	crop = "hades_extrafarming:lettuce",
	seed = "hades_extrafarming:lettuce",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
