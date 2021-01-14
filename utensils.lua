
local S = farming.intllib

-- wooden bowl

minetest.register_craftitem("hades_extrafarming:bowl", {
	description = S("Wooden Bowl"),
	inventory_image = "farming_bowl.png",
	groups = {food_bowl = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:bowl 4",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:bowl",
	burntime = 10,
})

-- saucepan

minetest.register_craftitem("hades_extrafarming:saucepan", {
	description = S("Saucepan"),
	inventory_image = "farming_saucepan.png",
	groups = {food_saucepan = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:saucepan",
	recipe = {
		{"hades_core:steel_ingot", "", ""},
		{"", "group:stick", ""}
	}
})

-- cooking pot

minetest.register_craftitem("hades_extrafarming:pot", {
	description = S("Cooking Pot"),
	inventory_image = "farming_pot.png",
	groups = {food_pot = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:pot",
	recipe = {
		{"group:stick", "hades_core:steel_ingot", "hades_core:steel_ingot"},
		{"", "hades_core:steel_ingot", "hades_core:steel_ingot"}
	}
})

-- baking tray

minetest.register_craftitem("hades_extrafarming:baking_tray", {
	description = S("Baking Tray"),
	inventory_image = "farming_baking_tray.png",
	groups = {food_baking_tray = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:baking_tray",
	recipe = {
		{"hades_core:clay_brick", "hades_core:clay_brick", "hades_core:clay_brick"},
		{"hades_core:clay_brick", "", "hades_core:clay_brick"},
		{"hades_core:clay_brick", "hades_core:clay_brick", "hades_core:clay_brick"}
	}
})

-- skillet

minetest.register_craftitem("hades_extrafarming:skillet", {
	description = S("Skillet"),
	inventory_image = "farming_skillet.png",
	groups = {food_skillet = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:skillet",
	recipe = {
		{"hades_core:steel_ingot", "", ""},
		{"", "hades_core:steel_ingot", ""},
		{"", "", "group:stick"}
	}
})

-- mortar and pestle

minetest.register_craftitem("hades_extrafarming:mortar_pestle", {
	description = S("Mortar and Pestle"),
	inventory_image = "farming_mortar_pestle.png",
	groups = {food_mortar_pestle = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:mortar_pestle",
	recipe = {
		{"hades_core:stone", "group:stick", "hades_core:stone"},
		{"", "hades_core:stone", ""}
	}
})

-- cutting board

minetest.register_craftitem("hades_extrafarming:cutting_board", {
	description = S("Cutting Board"),
	inventory_image = "farming_cutting_board.png",
	groups = {food_cutting_board = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:cutting_board",
	recipe = {
		{"hades_core:steel_ingot", "", ""},
		{"", "group:stick", ""},
		{"", "", "group:wood"}
	}
})

-- juicer

minetest.register_craftitem("hades_extrafarming:juicer", {
	description = S("Juicer"),
	inventory_image = "farming_juicer.png",
	groups = {food_juicer = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:juicer",
	recipe = {
		{"", "hades_core:stone", ""},
		{"hades_core:stone", "", "hades_core:stone"}
	}
})

-- glass mixing bowl

minetest.register_craftitem("hades_extrafarming:mixing_bowl", {
	description = S("Glass Mixing Bowl"),
	inventory_image = "farming_mixing_bowl.png",
	groups = {food_mixing_bowl = 1, flammable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:mixing_bowl",
	recipe = {
		{"hades_core:glass", "group:stick", "hades_core:glass"},
		{"", "hades_core:glass", ""}
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"hades_extrafarming:mixing_bowl"
	}
})
