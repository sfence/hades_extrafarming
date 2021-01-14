
local S = farming.intllib

--= Helpers

local eth = minetest.get_modpath("ethereal")
local alias = function(orig, new)
	minetest.register_alias(orig, new)
end

--= Overrides (add food_* group to apple and brown mushroom)

local old_groups = minetest.registered_items["hades_trees:apple"].groups;
old_groups.food_apple = 1;
minetest.override_item("hades_trees:apple", {
	groups = old_groups,
})

if minetest.registered_nodes["flowers:mushroom_brown"] then
minetest.override_item("flowers:mushroom_brown", {
	light_source = 1,
	groups = {food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 2}
})
end

--= Aliases

-- Banana
if eth then
	alias("farming_plus:banana_sapling", "ethereal:banana_tree_sapling")
	alias("farming_plus:banana_leaves", "ethereal:bananaleaves")
	alias("farming_plus:banana", "ethereal:banana")
else
	alias("farming_plus:banana_sapling", "hades_trees:banana_sapling")
	alias("farming_plus:banana_leaves", "hades_trees:banana_leaves")
	alias("farming_plus:banana", "hades_trees:banana")
end

-- Carrot
alias("farming_plus:carrot_seed", "hades_extrafarming:carrot")
alias("farming_plus:carrot_1", "hades_extrafarming:carrot_1")
alias("farming_plus:carrot_2", "hades_extrafarming:carrot_4")
alias("farming_plus:carrot_3", "hades_extrafarming:carrot_6")
alias("farming_plus:carrot", "hades_extrafarming:carrot_8")
alias("farming_plus:carrot_item", "hades_extrafarming:carrot")

-- Cocoa
alias("farming_plus:cocoa_sapling", "hades_extrafarming:cocoa_beans")
alias("farming_plus:cocoa_leaves", "default:leaves")
alias("farming_plus:cocoa", "default:apple")
alias("farming_plus:cocoa_bean", "hades_extrafarming:cocoa_beans")

-- Orange
alias("farming_plus:orange_1", "hades_extrafarming:tomato_1")
alias("farming_plus:orange_2", "hades_extrafarming:tomato_4")
alias("farming_plus:orange_3", "hades_extrafarming:tomato_6")

if eth then
	alias("farming_plus:orange_item", "ethereal:orange")
	alias("farming_plus:orange", "ethereal:orange")
	alias("farming_plus:orange_seed", "ethereal:orange_tree_sapling")
else
	alias("farming_plus:orange_item", "hades_trees:orange")
	alias("farming_plus:orange", "hades_trees:orange")
	alias("farming_plus:orange_seed", "hades_trees:orange_sapling")
end

-- Potato
alias("farming_plus:potato_item", "hades_farming:potato")
alias("farming_plus:potato_1", "hades_farming:potato_1")
alias("farming_plus:potato_2", "hades_farming:potato_2")
alias("farming_plus:potato", "hades_farming:potato_3")
alias("farming_plus:potato_seed", "hades_farming:potato")

-- Pumpkin
alias("hades_extrafarming:pumpkin_seed", "hades_extrafarming:pumpkin_slice")
alias("hades_extrafarming:pumpkin_face", "hades_extrafarming:jackolantern")
alias("hades_extrafarming:pumpkin_face_light", "hades_extrafarming:jackolantern_on")
alias("hades_extrafarming:big_pumpkin", "hades_extrafarming:jackolantern")
alias("hades_extrafarming:big_pumpkin_side", "air")
alias("hades_extrafarming:big_pumpkin_top", "air")
alias("hades_extrafarming:big_pumpkin_corner", "air")
alias("hades_extrafarming:scarecrow", "hades_extrafarming:jackolantern")
alias("hades_extrafarming:scarecrow_light", "hades_extrafarming:jackolantern_on")
alias("hades_extrafarming:pumpkin_flour", "hades_extrafarming:pumpkin_dough")

-- Rhubarb
alias("farming_plus:rhubarb_seed", "hades_extrafarming:rhubarb")
alias("farming_plus:rhubarb_1", "hades_extrafarming:rhubarb_1")
alias("farming_plus:rhubarb_2", "hades_extrafarming:rhubarb_2")
alias("farming_plus:rhubarb", "hades_extrafarming:rhubarb_3")
alias("farming_plus:rhubarb_item", "hades_extrafarming:rhubarb")

-- Strawberry
if eth then
	alias("farming_plus:strawberry_item", "ethereal:strawberry")
	alias("farming_plus:strawberry_seed", "ethereal:strawberry")
	alias("farming_plus:strawberry_1", "ethereal:strawberry_1")
	alias("farming_plus:strawberry_2", "ethereal:strawberry_3")
	alias("farming_plus:strawberry_3", "ethereal:strawberry_5")
	alias("farming_plus:strawberry", "ethereal:strawberry_7")
else
	alias("farming_plus:strawberry_item", "hades_farming:strawberry")
	alias("farming_plus:strawberry_seed", "hades_farming:seed_strawberry")
	alias("farming_plus:strawberry_1", "hades_farming:strawberry_1")
	alias("farming_plus:strawberry_2", "hades_farming:strawberry_2")
	alias("farming_plus:strawberry_3", "hades_farming:strawberry_3")
	alias("farming_plus:strawberry", "hades_farming:strawberry")
end

-- Tomato
alias("farming_plus:tomato_seed", "hades_extrafarming:tomato")
alias("farming_plus:tomato_item", "hades_extrafarming:tomato")
alias("farming_plus:tomato_1", "hades_extrafarming:tomato_2")
alias("farming_plus:tomato_2", "hades_extrafarming:tomato_4")
alias("farming_plus:tomato_3", "hades_extrafarming:tomato_6")
alias("farming_plus:tomato", "hades_extrafarming:tomato_8")

-- Weed
alias("hades_extrafarming:weed", "hades_core:grass_2")
