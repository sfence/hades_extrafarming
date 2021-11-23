
local S = farming.intllib

--= A nice addition from Ademant's grain mod :)

-- Rye

farming.register_plant("hades_extrafarming:rye", {
	description = S("Rye seed"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_rye_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("hades_extrafarming:rye", {
	description = S("Rye"),
	groups = {food_rye = 1, flammable = 4}
})

minetest.override_item("hades_extrafarming:rye_1", {drop = {}})
minetest.override_item("hades_extrafarming:rye_2", {drop = {}})
minetest.override_item("hades_extrafarming:rye_3", {drop = {}})

minetest.register_craft({
	output = "hades_extrafarming:flour",
	recipe = {
		{"hades_extrafarming:rye", "hades_extrafarming:rye", "hades_extrafarming:rye"},
		{"hades_extrafarming:rye", "hades_extrafarming:mortar_pestle", ""}
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

-- Oats

farming.register_plant("hades_extrafarming:oat", {
	description = S("Oat seed"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_oat_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("hades_extrafarming:oat", {
	description = S("Oats"),
	groups = {food_oats = 1, flammable = 4}
})

minetest.override_item("hades_extrafarming:oat_1", {drop = {}})
minetest.override_item("hades_extrafarming:oat_2", {drop = {}})
minetest.override_item("hades_extrafarming:oat_3", {drop = {}})

minetest.register_craft({
	output = "hades_extrafarming:flour",
	recipe = {
		{"hades_extrafarming:oat", "hades_extrafarming:oat", "hades_extrafarming:oat"},
		{"hades_extrafarming:oat", "hades_extrafarming:mortar_pestle", ""}
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

-- Rice

farming.register_plant("hades_extrafarming:rice", {
	description = S("Rice grains"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_rice_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("hades_extrafarming:rice", {
	description = S("Rice"),
	groups = {food_rice = 1, flammable = 4}
})

minetest.override_item("hades_extrafarming:rice_1", {drop = {}})
minetest.override_item("hades_extrafarming:rice_2", {drop = {}})
minetest.override_item("hades_extrafarming:rice_3", {drop = {}})

minetest.register_craftitem("hades_extrafarming:rice_bread", {
	description = S("Rice Bread"),
	inventory_image = "farming_rice_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_rice_bread = 1, flammable = 2, food = 2, eatable = 5}
})

minetest.register_craftitem("hades_extrafarming:rice_flour", {
	description = S("Rice Flour"),
	inventory_image = "farming_rice_flour.png",
	groups = {food_rice_flour = 1, flammable = 1}
})

minetest.register_craft({
	output = "hades_extrafarming:rice_flour",
	recipe = {
		{"hades_extrafarming:rice", "hades_extrafarming:rice", "hades_extrafarming:rice"},
		{"hades_extrafarming:rice", "hades_extrafarming:mortar_pestle", ""}
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:rice_bread",
	recipe = "hades_extrafarming:rice_flour"
})

-- Multigrain flour

minetest.register_craftitem("hades_extrafarming:flour_multigrain", {
	description = S("Multigrain Flour"),
	inventory_image = "farming_flour_multigrain.png",
	groups = {food_flour = 1, flammable = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:flour_multigrain",
	recipe = {
		"hades_farming:wheat", "hades_extrafarming:barley", "hades_extrafarming:oat",
		"hades_extrafarming:rye", "hades_extrafarming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

-- Multigrain bread

minetest.register_craftitem("hades_extrafarming:bread_multigrain", {
	description = S("Multigrain Bread"),
	inventory_image = "farming_bread_multigrain.png",
	on_use = minetest.item_eat(7),
	groups = {food_bread = 1, flammable = 2, food = 2, eatable = 7}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:bread_multigrain",
	recipe = "hades_extrafarming:flour_multigrain"
})

-- Fuels

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:rice_bread",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:bread_multigrain",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:rye",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:oat",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:rice",
	burntime = 1
})
