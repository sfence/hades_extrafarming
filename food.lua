
local S = farming.intllib

--= filter sea water into river water
minetest.register_craft({
	output = "hades_bucket:bucket_river_water",
	recipe = {
		{"hades_extrafarming:hemp_fibre"},
		{"hades_extrafarming:hemp_fibre"},
		{"hades_bucket:bucket_water"}
	}
})

--= glass of water

minetest.register_craftitem("hades_extrafarming:glass_water", {
	description = S("Glass of Water"),
	inventory_image = "farming_water_glass.png",
	groups = {food_water_glass = 1, flammable = 3, vessel = 1}
})

minetest.register_craft({
	output = "hades_extrafarming:glass_water 4",
	recipe = {
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"hades_bucket:hades_bucket_river_water", ""}
	},
	replacements = {{"hades_bucket:bucket_river_water", "hades_bucket:bucket_empty"}}
})

minetest.register_craft({
	output = "hades_extrafarming:glass_water 4",
	recipe = {
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"vessels:drinking_glass", "vessels:drinking_glass"},
		{"hades_bucket:bucket_water", "hades_extrafarming:hemp_fibre"}
	},
	replacements = {{"hades_bucket:bucket_water", "hades_bucket:bucket_empty"}}
})

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

--= Sugar caramel

minetest.register_craftitem("hades_extrafarming:caramel", {
	description = S("Caramel"),
	inventory_image = "farming_caramel.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 6,
	output = "hades_extrafarming:caramel",
	recipe = "group:food_sugar",
})

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
	},
	-- special function to make salt crystals form inside water
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 15.0 then return end
		self.ctimer = 0

		local needed

		if self.node_inside
		and self.node_inside.name == "hades_core:water_source" then
			needed = 8

		elseif self.node_inside
		and self.node_inside.name == "hades_default:river_water_source" then
			needed = 9
		end

		if not needed then return end

		local objs = core.get_objects_inside_radius(pos, 0.5)

		if not objs or #objs ~= 1 then return end

		local salt, ent = nil, nil

		for k, obj in pairs(objs) do

			ent = obj:get_luaentity()

			if ent and ent.name == "__builtin:item"
			and ent.itemstring == "hades_farming:salt " .. needed then

				obj:remove()

				core.add_item(pos, "hades_farming:salt_crystal")

				return false -- return with no further action
			end
		end
	end
})

--[[
minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_extrafarming:salt",
	recipe = "hades_bucket:bucket_water",
	replacements = {{"hades_bucket:bucket_water", "hades_bucket:bucket_empty"}}
})
--]]

--= Salt Crystal

minetest.register_node("hades_extrafarming:salt_crystal", {
	description = ("Salt crystal"),
	inventory_image = "farming_salt_crystal.png",
	wield_image = "farming_salt_crystal.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	light_source = 1,
	tiles = {"farming_salt_crystal.png"},
	groups = { dig_immediate = 3, attached_node = 1},
	sounds = hades_sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
})
minetest.register_craft({
--	type = "shapeless",
	output = "hades_extrafarming:salt 9",
	recipe = {
		{"hades_extrafarming:salt_crystal", "hades_extrafarming:mortar_pestle"}
	},
	replacements = {{"hades_extrafarming:mortar_pestle", "hades_extrafarming:mortar_pestle"}}
})

minetest.register_craft({
	output = "hades_extrafarming:salt_crystal",
	recipe = {
		{"hades_extrafarming:salt", "hades_extrafarming:salt", "hades_extrafarming:salt"},
		{"hades_extrafarming:salt", "hades_extrafarming:salt", "hades_extrafarming:salt"},
		{"hades_extrafarming:salt", "hades_extrafarming:salt", "hades_extrafarming:salt"}
	}
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
		{"group:water_bucket", "hades_bucket:bucket_empty"},
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
		{"group:food_sugar", "dye:pink", "group:food_sugar"}
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
	--type = "shapeless",
	output = "hades_extrafarming:garlic_bread",
	recipe = {
		{"group:food_toast", "group:food_garlic_clove", "group:food_garlic_clove"}
	}
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
	output = "hades_extrafarming:porridge",
	recipe = {
		{"group:food_oats", "group:food_oats", "group:food_oats"},
		{"group:food_oats", "group:food_bowl", "group:food_milk_glass"}
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
	--type = "shapeless",
	output = "hades_extrafarming:jaffa_cake",
	recipe = {
		{"hades_extrafarming:baking_tray", "group:food_egg", "group:food_sugar"},
		{"group:food_flour", "group:food_cocoa", "group:food_orange"},
		{"group:food_milk", "", ""}
	},
	replacements = {
		{"hades_extrafarming:baking_tray", "hades_extrafarming:baking_tray"},
		{"mobs:bucket_milk", "hades_bucket:bucket_empty"}
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
	output = "farming:apple_pie",
	recipe = {
		{"group:food_flour", "group:food_sugar", "group:food_apple"},
		{"", "group:food_baking_tray", ""}
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
	output = "hades_extrafarming:cactus_juice",
	recipe = {
		{"hades_core:cactus"},
		{"hades_extrafarming:juicer"},
		{"vessels:drinking_glass"}
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

minetest.register_craft({
	output = "hades_extrafarming:pasta",
	recipe = {
		{"group:food_flour", "group:food_butter", "group:food_mixing_bowl"}
	},
	replacements = {{"group:food_mixing_bowl", "hades_extrafarming:mixing_bowl"}}
})

minetest.register_craft({
	output = "hades_extrafarming:pasta",
	recipe = {
		{"group:food_flour", "group:food_oil", "group:food_mixing_bowl"}
	},
	replacements = {
		{"group:food_mixing_bowl", "hades_extrafarming:mixing_bowl"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})

-- Spaghetti

minetest.register_craftitem("hades_extrafarming:spaghetti", {
	description = S("Spaghetti"),
	inventory_image = "farming_spaghetti.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8)
})

minetest.register_craft({
	output = "hades_extrafarming:spaghetti",
	recipe = {
		{"group:food_pasta", "group:food_saucepan", "group:food_tomato"},
		{"group:food_garlic_clove", "group:food_garlic_clove", ""}
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

minetest.register_craft({
	output = "hades_extrafarming:bibimbap",
	recipe = {
		{"group:food_skillet", "group:food_bowl", "group:food_egg"},
		{"group:food_rice", "group:food_chicken_raw", "group:food_cabbage"},
		{"group:food_carrot", "group:food_chili_pepper", ""}
	},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})

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

-- Burger

minetest.register_craftitem("hades_extrafarming:burger", {
	description = S("Burger"),
	inventory_image = "farming_burger.png",
  groups = {food = 2, eatable = 16},
	on_use = minetest.item_eat(16),
})

minetest.register_craft({
	output = "hades_extrafarming:burger",
	recipe = {
		{"hades_farming:bread", "group:food_meat", "group:food_cheese"},
		{"group:food_tomato", "group:food_cucumber", "group:food_onion"},
		{"group:food_lettuce", "", ""}
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
	}
})

-- Triple Berry Smoothie

minetest.register_craftitem("hades_extrafarming:smoothie_berry", {
	description = S("Triple Berry Smoothie"),
	inventory_image = "farming_berry_smoothie.png",
	on_use = minetest.item_eat(6, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1, food = 3, eatable = 6}
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

-- Patatas a la importancia

minetest.register_craftitem("hades_extrafarming:spanish_potatoes", {
	description = S("Spanish Potatoes"),
	inventory_image = "farming_spanish_potatoes.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8, "hades_extrafarming:bowl"),
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:spanish_potatoes",
	recipe = {
		"hades_farming:potato", "group:food_parsley", "hades_farming:potato",
		"group:food_egg", "group:food_flour", "hades_extrafarming:onion",
		"hades_extrafarming:garlic_clove", "group:food_bowl", "group:food_skillet"
	},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})

-- Potato omelet

minetest.register_craftitem("hades_extrafarming:potato_omelet", {
	description = S("Potato omelet"),
	inventory_image = "farming_potato_omelet.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:potato_omelet",
	recipe = {
		"group:food_egg", "hades_farming:potato", "group:food_onion",
		"group:food_skillet", "group:food_bowl"},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})

-- Paella

minetest.register_craftitem("hades_extrafarming:paella", {
	description = S("Paella"),
	inventory_image = "farming_paella.png",
  groups = {food = 2, eatable = 8},
	on_use = minetest.item_eat(8, "hades_extrafarming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:paella",
	recipe = {
		"group:food_rice", "dye:orange", "hades_extrafarming:pepper_red",
		"group:food_peas", "group:food_chicken", "group:food_bowl", "group:food_skillet"
	},
	replacements = {{"group:food_skillet", "hades_extrafarming:skillet"}}
})

-- Flan

minetest.register_craftitem("hades_extrafarming:flan", {
	description = S("Vanilla Flan"),
	inventory_image = "farming_vanilla_flan.png",
  groups = {food = 2, eatable = 6},
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "hades_extrafarming:flan",
	recipe = {
		{"group:food_sugar", "group:food_milk", "hades_extrafarming:caramel"},
		{"group:food_egg", "group:food_egg", "hades_extrafarming:vanilla_extract"}
	},
	replacements = {
		{"cucina_vegana:soy_milk", "vessels:drinking_glass"},
		{"group:food_milk", "hades_bucket:bucket_empty"},
		{"hades_extrafarming:vanilla_extract", "vessels:glass_bottle"}
	}
})

-- Vegan Cheese

minetest.register_craftitem("hades_extrafarming:cheese_vegan", {
	description = S("Vegan Cheese"),
	inventory_image = "farming_cheese_vegan.png",
	on_use = minetest.item_eat(2),
	groups = {food_cheese = 1, flammable = 2, eatable = 2}
})


minetest.register_craft({
	output = "hades_extrafarming:cheese_vegan",
	recipe = {
		{"hades_extrafarming:soy_milk", "hades_extrafarming:soy_milk", "hades_extrafarming:soy_milk"},
		{"group:food_salt", "group:food_peppercorn", "hades_extrafarming:bottle_ethanol"},
		{"group:food_gelatin", "group:food_pot", ""}
	},
	replacements = {
		{"hades_extrafarming:soy_milk", "vessels:drinking_glass 3"},
		{"hades_extrafarming:pot", "hades_extrafarming:pot"},
		{"hades_extrafarming:bottle_ethanol", "vessels:glass_bottle"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:cheese_vegan",
	recipe = {
		{"hades_extrafarming:soy_milk", "hades_extrafarming:soy_milk", "hades_extrafarming:soy_milk"},
		{"group:food_salt", "group:food_peppercorn", "group:food_lemon"},
		{"group:food_gelatin", "group:food_pot", ""}
	},
	replacements = {
		{"hades_extrafarming:soy_milk", "vessels:drinking_glass 3"},
		{"hades_extrafarming:pot", "hades_extrafarming:pot"}
	}
})

-- Onigiri

minetest.register_craftitem("hades_extrafarming:onigiri", {
	description = S("Onirigi"),
	inventory_image = "farming_onigiri.png",
	on_use = minetest.item_eat(2),
	groups = {flammable = 2, eatable = 2}
})

minetest.register_craft({
	output = "hades_extrafarming:onigiri",
	recipe = {
		{"group:food_rice", "group:food_salt", "group:food_rice"},
		{"", "group:food_seaweed", ""}
	}
})

-- Gyoza

minetest.register_craftitem("hades_extrafarming:gyoza", {
	description = S("Gyoza"),
	inventory_image = "farming_gyoza.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, eatable = 4}
})

minetest.register_craft({
	output = "hades_extrafarming:gyoza 4",
	recipe = {
		{"group:food_cabbage", "group:food_garlic_clove", "group:food_onion"},
		{"group:food_meat_raw", "group:food_salt", "group:food_flour"},
		{"", "group:food_skillet", ""}

	},
	replacements = {
		{"group:food_skillet", "hades_extrafarming:skillet"}
	}
})

-- Mochi

minetest.register_craftitem("hades_extrafarming:mochi", {
	description = S("Mochi"),
	inventory_image = "farming_mochi.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, eatable = 3}
})

minetest.register_craft({
	output = "hades_extrafarming:mochi",
	recipe = {
		{"group:food_rice", "group:food_sugar", "group:food_rice"},
		{"", "group:food_mortar_pestle", ""},
		{"", "hades_extrafarming:glass_water", ""}
	},
	replacements = {
		{"group:food_mortar_pestle", "hades_extrafarming:mortar_pestle"},
		{"hades_extrafarming:glass_water", "vessels:drinking_glass"}
	}
})
