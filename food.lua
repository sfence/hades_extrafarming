
local S = farming.intllib

--= Sugar

--[[
minetest.register_craftitem("hades_extrafarming:sugar", {
	description = S("Sugar"),
	inventory_image = "farming_sugar.png",
	groups = {food_sugar = 1, flammable = 3}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "hades_extrafarming:sugar 2",
	recipe = "default:papyrus"
})
--]]


--= Salt

minetest.register_node("hades_extrafarming:salt", {
	description = S("Salt"),
	inventory_image = "farming_salt.png",
	wield_image = "farming_salt.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"farming_salt.png"},
	groups = {food_salt = 1, vessel = 1, dig_immediate = 3,
			attached_node = 1},
	sounds = hades_sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:salt",
	recipe = "bucket:bucket_water",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

--= Rose Water

minetest.register_node("hades_extrafarming:rose_water", {
	description = S("Rose Water"),
	inventory_image = "farming_rose_water.png",
	wield_image = "farming_rose_water.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"farming_rose_water.png"},
	groups = {food_rose_water = 1, vessel = 1, dig_immediate = 3,
			attached_node = 1},
	sounds = hades_sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:rose_water",
	recipe = {
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"group:water_bucket", "group:food_pot", "vessels:glass_bottle"}
	},
	replacements = {
		{"group:water_bucket", "bucket:bucket_empty"},
		{"group:food_pot", "hades_extrafarming:pot"}
	}
})

if minetest.get_modpath("bucket_wooden") then
	minetest.register_craft({
		output = "hades_extrafarming:rose_water",
		recipe = {
			{"flowers:rose", "flowers:rose", "flowers:rose"},
			{"flowers:rose", "flowers:rose", "flowers:rose"},
			{"group:water_bucket_wooden", "group:food_pot", "vessels:glass_bottle"}
		},
		replacements = {
			{"group:water_bucket_wooden", "bucket_wooden:bucket_empty"},
			{"group:food_pot", "hades_extrafarming:pot"}
		}
	})
end

--= Turkish Delight

minetest.register_craftitem("hades_extrafarming:turkish_delight", {
	description = S("Turkish Delight"),
	inventory_image = "farming_turkish_delight.png",
	groups = {flammable = 3, food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "hades_extrafarming:turkish_delight 4",
	recipe = {
		{"group:food_gelatin", "group:food_sugar", "group:food_gelatin"},
		{"group:food_sugar", "group:food_rose_water", "group:food_sugar"},
		{"group:food_cornstarch", "group:food_sugar", "dye:pink"}
	},
	replacements = {
		{"group:food_cornstarch", "hades_extrafarming:bowl"},
		{"group:food_rose_water", "vessels:glass_bottle"}
	}
})

--= Garlic Bread

minetest.register_craftitem("hades_extrafarming:garlic_bread", {
	description = S("Garlic Bread"),
	inventory_image = "farming_garlic_bread.png",
	groups = {flammable = 3, food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:garlic_bread",
	recipe = {"group:food_toast", "group:food_garlic_clove", "group:food_garlic_clove"}
})

--= Donuts (thanks to Bockwurst for making the donut images)

minetest.register_craftitem("hades_extrafarming:donut", {
	description = S("Donut"),
	inventory_image = "farming_donut.png",
  groups = {food = 2, eatable = 4},
	on_use = minetest.item_eat(4)
})

minetest.register_craft({
	output = "hades_extrafarming:donut 3",
	recipe = {
		{"", "group:food_wheat", ""},
		{"group:food_wheat", "group:food_sugar", "group:food_wheat"},
		{"", "group:food_wheat", ""}
	}
})

minetest.register_craftitem("hades_extrafarming:donut_chocolate", {
	description = S("Chocolate Donut"),
	inventory_image = "farming_donut_chocolate.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:donut_chocolate",
	recipe = {
		{"group:food_cocoa"},
		{"hades_extrafarming:donut"}
	}
})

minetest.register_craftitem("hades_extrafarming:donut_apple", {
	description = S("Apple Donut"),
	inventory_image = "farming_donut_apple.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:donut_apple",
	recipe = {
		{"hades_trees:apple"},
		{"hades_extrafarming:donut"}
	}
})

--= Porridge Oats

minetest.register_craftitem("hades_extrafarming:porridge", {
	description = S("Porridge"),
	inventory_image = "farming_porridge.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:porridge",
	recipe = {
		"group:food_oats", "group:food_oats", "group:food_oats",
		"group:food_oats", "group:food_bowl", "group:food_milk_glass"
	},
	replacements = {
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"hades_extrafarming:soy_milk", "vessels:drinking_glass"}
	}
})

--= Jaffa Cake

minetest.register_craftitem("hades_extrafarming:jaffa_cake", {
	description = S("Jaffa Cake"),
	inventory_image = "farming_jaffa_cake.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:jaffa_cake",
	recipe = {
		"hades_extrafarming:baking_tray", "group:food_egg", "group:food_sugar",
		"group:food_flour", "group:food_cocoa", "group:food_orange",
		"group:food_milk"
	},
	replacements = {
		{"hades_extrafarming:baking_tray", "hades_extrafarming:baking_tray"},
		{"mobs:bucket_milk", "bucket:bucket_empty"}
	}
})

-- Apple Pie

minetest.register_craftitem("hades_extrafarming:apple_pie", {
	description = S("Apple Pie"),
	inventory_image = "farming_apple_pie.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:apple_pie",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_sugar",
		"group:food_apple", "group:food_baking_tray"
	},
	replacements = {{"group:food_baking_tray", "hades_extrafarming:baking_tray"}}
})

-- Cactus Juice

minetest.register_craftitem("hades_extrafarming:cactus_juice", {
	description = S("Cactus Juice"),
	inventory_image = "farming_cactus_juice.png",
	groups = {vessel = 1, drink = 1, food = 3, eatable = 2},
	on_use = function(itemstack, user, pointed_thing)
		if user then
			if math.random(5) == 1 then
				return minetest.do_item_eat(-1, "vessels:drinking_glass",
						itemstack, user, pointed_thing)
			else
				return minetest.do_item_eat(2, "vessels:drinking_glass",
						itemstack, user, pointed_thing)
			end
		end
	end
})

minetest.register_craft({
	output = "hades_extrafarming:cactus_juice 2",
	type = "shapeless",
	recipe = {
		"vessels:drinking_glass", "vessels:drinking_glass",
		"hades_core:cactus", "hades_extrafarming:juicer"
	},
	replacements = {
		{"group:food_juicer", "hades_extrafarming:juicer"}
	}
})

-- Pasta

minetest.register_craftitem("hades_extrafarming:pasta", {
	description = S("Pasta"),
	inventory_image = "farming_pasta.png",
	groups = {food_pasta = 1}
})

if minetest.get_modpath("mobs_animal") or minetest.get_modpath("xanadu")then
minetest.register_craft({
	output = "hades_extrafarming:pasta",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_mixing_bowl",
		"group:food_butter"
	},
	replacements = {{"group:food_mixing_bowl", "hades_extrafarming:mixing_bowl"}}
})
else
minetest.register_craft({
	output = "hades_extrafarming:pasta",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_mixing_bowl",
		"group:food_oil"
	},
	replacements = {
		{"group:food_mixing_bowl", "hades_extrafarming:mixing_bowl"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})
end

-- Spaghetti

minetest.register_craftitem("hades_extrafarming:spaghetti", {
	description = S("Spaghetti"),
	inventory_image = "farming_spaghetti.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8)
})

minetest.register_craft({
	output = "hades_extrafarming:spaghetti",
	type = "shapeless",
	recipe = {
		"group:food_pasta", "group:food_saucepan",
		"group:food_tomato", "group:food_garlic_clove", "group:food_garlic_clove"
	},
	replacements = {{"group:food_saucepan", "hades_extrafarming:saucepan"}}
})

-- Korean Bibimbap

minetest.register_craftitem("hades_extrafarming:bibimbap", {
	description = S("Bibimbap"),
	inventory_image = "farming_bibimbap.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8, "hades_extrafarming:bowl")
})

if minetest.get_modpath("mobs_animal") or minetest.get_modpath("xanadu")then
minetest.register_craft({
	output = "hades_extrafarming:bibimbap",
	type = "shapeless",
	recipe = {
		"group:food_skillet", "group:food_bowl", "group:food_egg", "group:food_rice",
		"group:food_chicken_raw", "group:food_cabbage", "group:food_carrot",
		"group:food_chili_pepper"
	},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})
else
minetest.register_craft({
	output = "hades_extrafarming:bibimbap",
	type = "shapeless",
	recipe = {
		"group:food_skillet", "group:food_bowl", "group:food_mushroom",
		"group:food_rice", "group:food_cabbage", "group:food_carrot",
		"group:food_mushroom", "group:food_chili_pepper"
	},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})
end

-- Burger

minetest.register_craftitem("hades_extrafarming:burger", {
	description = S("Burger"),
	inventory_image = "farming_burger.png",
  groups = {food = 2, eatable = 16},
	on_use = minetest.item_eat(16),
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:burger",
	recipe = {
		"hades_farming:bread", "group:food_meat", "group:food_cheese",
		"group:food_tomato", "group:food_cucumber", "group:food_onion",
		"group:food_lettuce"
	}
})

-- Salad

minetest.register_craftitem("hades_extrafarming:salad", {
	description = S("Salad"),
	inventory_image = "farming_salad.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8, "hades_extrafarming:bowl")
})

minetest.register_craft({
	output = "hades_extrafarming:salad",
	type = "shapeless",
	recipe = {
		"group:food_bowl", "group:food_tomato", "group:food_cucumber",
		"group:food_lettuce", "group:food_oil"
	},
})

-- Triple Berry Smoothie

minetest.register_craftitem("hades_extrafarming:smoothie_berry", {
	description = S("Triple Berry Smoothie"),
	inventory_image = "farming_berry_smoothie.png",
	on_use = minetest.item_eat(6, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1}
})

minetest.register_craft({
	output = "hades_extrafarming:smoothie_berry",
	type = "shapeless",
	recipe = {
		"group:food_raspberries", "group:food_blackberries",
		"group:food_strawberry", "group:food_banana",
		"vessels:drinking_glass"
	}
})
