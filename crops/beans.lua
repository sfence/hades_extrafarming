--[[
	All textures by
	(C) Auke Kok <sofar@foo-projects.org>
	CC-BY-SA-3.0
]]

local S = farming.intllib

-- place beans
local function place_beans(itemstack, placer, pointed_thing, plantname)

	local pt = pointed_thing

	-- check if pointing at a node
	if not pt or pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)

	-- return if any of the nodes are not registered
	if not minetest.registered_nodes[under.name] then
		return
	end

	-- am I right-clicking on something that has a custom on_place set?
	-- thanks to Krock for helping with this issue :)
	local def = minetest.registered_nodes[under.name]
	if placer and itemstack and def and def.on_rightclick then
		return def.on_rightclick(pt.under, under, placer, itemstack, pt)
	end

	-- is player planting crop?
	local name = placer and placer:get_player_name() or ""

	-- check for protection
	if minetest.is_protected(pt.under, name) then
		return
	end

	-- check if pointing at bean pole
	if under.name ~= "hades_extrafarming:beanpole" then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.set_node(pt.under, {name = plantname})

	minetest.sound_play("default_place_node", {pos = pt.under, gain = 1.0})

	if placer or not farming.is_creative(placer:get_player_name()) then

		itemstack:take_item()

		-- check for refill
		if itemstack:get_count() == 0 then

			minetest.after(0.20,
				farming.refill_plant,
				placer,
				"hades_extrafarming:beans",
				placer:get_wield_index()
			)
		end
	end

	return itemstack
end
-- bean seeds
minetest.register_node("hades_extrafarming:seed_bean", {
	description = S("Green Beans Seeds"),
	tiles = {"crops_green_bean_seed.png"},
	inventory_image = "crops_green_bean_seed.png",
	wield_image = "crops_green_bean_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return place_beans(itemstack, placer, pointed_thing, "hades_extrafarming:beanpole_1")
	end
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_bean",
	recipe = {"hades_extrafarming:beans"}
})

-- beans
minetest.register_craftitem("hades_extrafarming:beans", {
	description = S("Green Beans"),
	inventory_image = "farming_beans.png",
	groups = {food_beans = 1, flammable = 2, food = 2, eatable = 1},
	on_use = minetest.item_eat(1),
})

-- beans can be used for green dye
minetest.register_craft({
	output = "dye:green",
	recipe = {{"hades_extrafarming:seed_bean"}}
})

-- beanpole
minetest.register_node("hades_extrafarming:beanpole", {
	description = S("Bean Pole (place on soil before planting beans)"),
	drawtype = "plantlike",
	tiles = {"farming_beanpole.png"},
	inventory_image = "farming_beanpole.png",
	visual_scale = 1.90,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "hades_extrafarming:beanpole",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, attached_node = 1},
	sounds = hades_sounds.node_sound_leaves_defaults(),

	on_place = function(itemstack, placer, pointed_thing)

		local pt = pointed_thing

		-- check if pointing at a node
		if not pt or pt.type ~= "node" then
			return
		end

		local under = minetest.get_node(pt.under)

		-- return if any of the nodes are not registered
		if not minetest.registered_nodes[under.name] then
			return
		end

		-- am I right-clicking on something that has a custom on_place set?
		-- thanks to Krock for helping with this issue :)
		local def = minetest.registered_nodes[under.name]
		if def and def.on_rightclick then
			return def.on_rightclick(pt.under, under, placer, itemstack, pt)
		end

		if minetest.is_protected(pt.above, placer:get_player_name()) then
			return
		end

		local nodename = under.name

		if minetest.get_item_group(nodename, "soil") < 2 then
			return
		end

		local top = {
			x = pointed_thing.above.x,
			y = pointed_thing.above.y + 1,
			z = pointed_thing.above.z
		}

		nodename = minetest.get_node(top).name

		if nodename ~= "air" then
			return
		end

		minetest.set_node(pointed_thing.above, {name = "hades_extrafarming:beanpole"})

		if not farming.is_creative(placer:get_player_name()) then
			itemstack:take_item()
		end

		return itemstack
	end
})

minetest.register_craft({
	output = "hades_extrafarming:beanpole",
	recipe = {
		{"", "", ""},
		{"group:stick", "", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:beanpole",
	burntime = 10
})

-- green bean definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_beanpole_1.png"},
	visual_scale = 1.90,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"hades_extrafarming:beanpole"}, rarity = 1}
		}
	},
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 3, not_in_creative_inventory = 1,
		attached_node = 1, growing = 1, plant = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("hades_extrafarming:beanpole_1", table.copy(def))

-- stage2
def.tiles = {"farming_beanpole_2.png"}
minetest.register_node("hades_extrafarming:beanpole_2", table.copy(def))

-- stage 3
def.tiles = {"farming_beanpole_3.png"}
minetest.register_node("hades_extrafarming:beanpole_3", table.copy(def))

-- stage 4
def.tiles = {"farming_beanpole_4.png"}
minetest.register_node("hades_extrafarming:beanpole_4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_beanpole_5.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"hades_extrafarming:beanpole"}, rarity = 1},
		{items = {"hades_extrafarming:beans 3"}, rarity = 1},
		{items = {"hades_extrafarming:beans 2"}, rarity = 2},
		{items = {"hades_extrafarming:beans 2"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:beanpole_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:beans"] = {
	trellis = "hades_extrafarming:beanpole",
	crop = "hades_extrafarming:beanpole",
	seed = "hades_extrafarming:beans",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}

-- wild green bean bush (this is what you find on the map)
minetest.register_node("hades_extrafarming:beanbush", {
	drawtype = "plantlike",
	tiles = {"farming_beanbush.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"hades_extrafarming:beans 1"}, rarity = 1},
			{items = {"hades_extrafarming:beans 1"}, rarity = 2},
			{items = {"hades_extrafarming:beans 1"}, rarity = 3}
		}
	},
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
})

-- mapgen
--[[
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.beans,
		spread = {x = 100, y = 100, z = 100},
		seed = 345,
		octaves = 3,
		persist = 0.6
	},
	y_min = 18,
	y_max = 38,
	decoration = "farming:beanbush"
})
--]]
