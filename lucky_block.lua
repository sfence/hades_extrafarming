
-- add lucky blocks

if minetest.get_modpath("lucky_block") then

	lucky_block:add_blocks({
		{"dro", {"hades_extrafarming:corn"}, 5},
		{"dro", {"hades_extrafarming:coffee_cup_hot"}, 1},
		{"dro", {"hades_extrafarming:bread"}, 5},
		{"nod", "hades_extrafarming:jackolantern", 0},
		{"tro", "hades_extrafarming:jackolantern_on"},
		{"nod", "default:river_water_source", 1},
		{"tel"},
		{"dro", {"hades_extrafarming:trellis", "hades_extrafarming:grapes"}, 5},
		{"dro", {"hades_extrafarming:bottle_ethanol"}, 1},
		{"nod", "hades_extrafarming:melon", 0},
		{"dro", {"hades_extrafarming:donut", "hades_extrafarming:donut_chocolate", "hades_extrafarming:donut_apple"}, 5},
		{"dro", {"hades_extrafarming:hemp_leaf", "hades_extrafarming:hemp_fibre", "hades_extrafarming:seed_hemp"}, 10},
		{"nod", "fire:permanent_flame", 1},
		{"dro", {"hades_extrafarming:chili_pepper", "hades_extrafarming:chili_bowl"}, 5},
		{"dro", {"hades_extrafarming:bowl"}, 3},
		{"dro", {"hades_extrafarming:saucepan"}, 1},
		{"dro", {"hades_extrafarming:pot"}, 1},
		{"dro", {"hades_extrafarming:baking_tray"}, 1},
		{"dro", {"hades_extrafarming:skillet"}, 1},
		{"exp", 4},
		{"dro", {"hades_extrafarming:mortar_pestle"}, 1},
		{"dro", {"hades_extrafarming:cutting_board"}, 1},
		{"dro", {"hades_extrafarming:juicer"}, 1},
		{"dro", {"hades_extrafarming:mixing_bowl"}, 1},
		{"dro", {"hades_extrafarming:hoe_bronze"}, 1},
		{"dro", {"hades_extrafarming:hoe_mese"}, 1},
		{"dro", {"hades_extrafarming:hoe_diamond"}, 1},
		{"dro", {"hades_extrafarming:hoe_bomb"}, 10},
		{"dro", {"hades_extrafarming:turkish_delight"}, 5},
		{"lig"},
		{"dro", {"hades_extrafarming:scythe_mithril"}, 1},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:carrot_8"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:rhubarb_3"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:pepper_5"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:onion_5"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:beetroot_5"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:barley_7"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:corn_8"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:grapes_8"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:pea_5"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:coffee_5"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:raspberry_4"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:tomato_8"},
		}},
		{"sch", "instafarm", 0, true, {
			{"hades_extrafarming:wheat_8", "hades_extrafarming:chili_8"},
			{"hades_extrafarming:cotton_8", "hades_extrafarming:cucumber_4"},
		}},
		{"nod", "default:chest", 0, {
			{name = "hades_extrafarming:seed_wheat", max = 15},
			{name = "hades_extrafarming:seed_barley", max = 15},
			{name = "hades_extrafarming:seed_barley", max = 15},
			{name = "hades_extrafarming:seed_hemp", max = 15},
			{name = "hades_extrafarming:seed_rye", max = 15},
			{name = "hades_extrafarming:seed_rice", max = 15},
			{name = "hades_extrafarming:seed_oat", max = 15},
			{name = "hades_extrafarming:soil_wet", max = 10},
		}},
	})
end
