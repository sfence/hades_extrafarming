
local S = farming.intllib

-- place trellis
local function place_grapes(itemstack, placer, pointed_thing, plantname)

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
		return def.on_rightclick(pt.under, under, placer, itemstack)
	end

	-- is player planting seed?
	local name = placer and placer:get_player_name() or ""

	-- check for protection
	if minetest.is_protected(pt.under, name) then
		return
	end

	-- check if pointing at trellis
	if under.name ~= "hades_extrafarming:trellis" then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.set_node(pt.under, {name = plantname})

	minetest.sound_play("default_place_node", {pos = pt.under, gain = 1.0})

	if placer and not farming.is_creative(placer:get_player_name()) then

		itemstack:take_item()

		-- check for refill
		if itemstack:get_count() == 0 then

			minetest.after(0.20,
				farming.refill_plant,
				placer,
				"hades_extrafarming:grapes",
				placer:get_wield_index()
			)
		end
	end

	return itemstack
end

-- grapes seed
minetest.register_node("hades_extrafarming:seed_grapes", {
	description = S("Grapes Seed"),
	tiles = {"farming_grapes_seed.png"},
	inventory_image = "farming_grapes_seed.png",
	wield_image = "farming_grapes_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return place_grapes(itemstack, placer, pointed_thing, "hades_extrafarming:grapes_1")
	end,
})

-- grapes
minetest.register_craftitem("hades_extrafarming:grapes", {
	description = S("Grapes"),
	inventory_image = "farming_grapes.png",
	on_use = minetest.item_eat(2),
	groups = {food_grapes = 1, flammable = 3, food = 2, eatable = 2},
})

-- grapes can be used for violet dye
minetest.register_craft({
	output = "dye:violet",
	recipe = {
		{"hades_extrafarming:grapes"}
	}
})

-- trellis
minetest.register_node("hades_extrafarming:trellis", {
	description = S("Trellis (place on soil before planting grapes)"),
	drawtype = "plantlike",
	tiles = {"farming_trellis.png"},
	inventory_image = "farming_trellis.png",
	visual_scale = 1.9,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "hades_extrafarming:trellis",
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
			return def.on_rightclick(pt.under, under, placer, itemstack)
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

		minetest.set_node(pointed_thing.above, {name = "hades_extrafarming:trellis"})

		if not farming.is_creative(placer:get_player_name()) then
			itemstack:take_item()
		end

		return itemstack
	end
})

minetest.register_craft({
	output = "hades_extrafarming:trellis",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_extrafarming:trellis",
	burntime = 15
})

-- grapes definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_grapes_1.png"},
	visual_scale = 1.9,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"hades_extrafarming:trellis"}, rarity = 1},
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
minetest.register_node("hades_extrafarming:grapes_1", table.copy(def))

-- stage2
def.tiles = {"farming_grapes_2.png"}
minetest.register_node("hades_extrafarming:grapes_2", table.copy(def))

-- stage 3
def.tiles = {"farming_grapes_3.png"}
minetest.register_node("hades_extrafarming:grapes_3", table.copy(def))

-- stage 4
def.tiles = {"farming_grapes_4.png"}
minetest.register_node("hades_extrafarming:grapes_4", table.copy(def))

-- stage 5
def.tiles = {"farming_grapes_5.png"}
minetest.register_node("hades_extrafarming:grapes_5", table.copy(def))

-- stage 6
def.tiles = {"farming_grapes_6.png"}
minetest.register_node("hades_extrafarming:grapes_6", table.copy(def))

-- stage 7
def.tiles = {"farming_grapes_7.png"}
minetest.register_node("hades_extrafarming:grapes_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_grapes_8.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:trellis"}, rarity = 1},
		{items = {"hades_extrafarming:grapes 3", "hades_extrafarming:seed_grapes"}, rarity = 1},
		{items = {"hades_extrafarming:grapes 1"}, rarity = 2},
		{items = {"hades_extrafarming:grapes 1", "hades_extrafarming:seed_grapes"}, rarity = 3}
	}
}
minetest.register_node("hades_extrafarming:grapes_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:grapes"] = {
	crop = "hades_extrafarming:grapes",
	seed = "hades_extrafarming:seed_grapes",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 8
}

-- wild grape vine (this is what you find on the map)
minetest.register_node("hades_extrafarming:grapebush", {
	drawtype = "plantlike",
	tiles = {"farming_grapebush.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"hades_extrafarming:grapes 1", "hades_extrafarming:seed_grapes"}, rarity = 1},
			{items = {"hades_extrafarming:grapes 1"}, rarity = 2},
			{items = {"hades_extrafarming:grapes 1", "hades_extrafarming:seed_grapes"}, rarity = 3}
		}
	},
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults()
})
