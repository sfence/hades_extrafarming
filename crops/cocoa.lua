
local S = farming.intllib

--[[
-- place cocoa
local function place_cocoa(itemstack, placer, pointed_thing, plantname)

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

	-- check if pointing at jungletree
	if under.name ~= "hades_trees:jungletree"
	or minetest.get_node(pt.above).name ~= "air" then
		return
	end

	-- is player planting crop?
	local name = placer and placer:get_player_name() or ""

	-- check for protection
	if minetest.is_protected(pt.above, name) then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.set_node(pt.above, {name = plantname})

	minetest.sound_play("default_place_node", {pos = pt.above, gain = 1.0})

	if placer and not farming.is_creative(placer:get_player_name()) then

		itemstack:take_item()

		-- check for refill
		if itemstack:get_count() == 0 then

			minetest.after(0.20,
				farming.refill_plant,
				placer,
				"hades_extrafarming:cocoa_beans",
				placer:get_wield_index()
			)
		end
	end

	return itemstack
end

-- cocoa seed
minetest.register_node("hades_extrafarming:seed_cocoa", {
	description = S("Cocoa Seed"),
	tiles = {"farming_cocoa_seed.png"},
	inventory_image = "farming_cocoa_seed.png",
	wield_image = "farming_cocoa_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return place_cocoa(itemstack, placer, pointed_thing, "hades_extrafarming:cocoa_1")
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_extrafarming:seed_cocoa",
	recipe = {"group:food_cocoa"}
})

-- cocoa beans
minetest.register_craftitem("hades_extrafarming:cocoa_beans", {
	description = S("Cocoa Beans"),
	inventory_image = "farming_cocoa_beans.png",
	groups = {food_cocoa = 1, flammable = 2},
})

minetest.register_craft( {
	output = "dye:brown 2",
	recipe = {{"hades_extrafarming:cocoa_beans"}}
})
--]]

-- chocolate cookie
minetest.register_craftitem("hades_extrafarming:cookie", {
	description = S("Cookie"),
	inventory_image = "farming_cookie.png",
  groups = {food = 2, eatable = 2},
	on_use = minetest.item_eat(2)
})

minetest.register_craft( {
	output = "hades_extrafarming:cookie 8",
	recipe = {
		{"group:food_wheat", "group:food_cocoa", "group:food_wheat" }
	}
})

-- bar of dark chocolate (thanks to Ice Pandora for her deviantart.com chocolate tutorial)
minetest.register_craftitem("hades_extrafarming:chocolate_dark", {
	description = S("Bar of Dark Chocolate"),
	inventory_image = "farming_chocolate_dark.png",
  groups = {food = 2, eatable = 3},
	on_use = minetest.item_eat(3)
})

minetest.register_craft( {
	output = "hades_extrafarming:chocolate_dark",
	recipe = {
		{"group:food_cocoa", "group:food_cocoa", "group:food_cocoa"}
	}
})

-- chocolate block
minetest.register_node("hades_extrafarming:chocolate_block", {
	description = S("Chocolate Block"),
	tiles = {"farming_chocolate_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, oddly_breakable_by_hand = 2},
	sounds = hades_sounds.node_sound_stone_defaults()
})

minetest.register_craft({
	output = "hades_extrafarming:chocolate_block",
	recipe = {
		{"hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark"},
		{"hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark"},
		{"hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark", "hades_extrafarming:chocolate_dark"}
	}
})

minetest.register_craft({
	output = "hades_extrafarming:chocolate_dark 9",
	recipe = {{"hades_extrafarming:chocolate_block"}}
})

--[[
-- cocoa definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_cocoa_1.png"},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	drop = {},
	groups = {
		snappy = 3, flammable = 2, plant = 1, growing = 1,
		not_in_creative_inventory = 1, leafdecay = 1, leafdecay_drop = 1
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	growth_check = function(pos, node_name)

		if minetest.find_node_near(pos, 1, {"hades_trees:jungletree"}) then
			return false -- can grow
		end

		return true -- cannot grow
	end
}

-- stage 1
minetest.register_node("hades_extrafarming:cocoa_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cocoa_2.png"}
minetest.register_node("hades_extrafarming:cocoa_2", table.copy(def))

-- stage3
def.tiles = {"farming_cocoa_3.png"}
def.drop = {
	items = {
		{items = {"hades_extrafarming:cocoa_beans 1"}, rarity = 1}
	}
}
minetest.register_node("hades_extrafarming:cocoa_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_cocoa_4.png"}
def.groups.growing = nil
def.growth_check = nil
def.drop = {
	items = {
		{items = {"hades_extrafarming:cocoa_beans 2"}, rarity = 1},
		{items = {"hades_extrafarming:cocoa_beans 1"}, rarity = 2},
		{items = {"hades_extrafarming:cocoa_beans 1"}, rarity = 4}
	}
}
minetest.register_node("hades_extrafarming:cocoa_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["hades_extrafarming:cocoa_beans"] = {
	crop = "hades_extrafarming:cocoa",
	seed = "hades_extrafarming:seed_cocoa",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 4
}

-- add random cocoa pods to jungle tree's
minetest.register_on_generated(function(minp, maxp)

	if maxp.y < 0 then
		return
	end

	local pos, dir
	local cocoa = minetest.find_nodes_in_area(minp, maxp, "default:jungletree")

	for n = 1, #cocoa do

		pos = cocoa[n]

		if minetest.find_node_near(pos, 1,
			{"default:jungleleaves", "moretrees:jungletree_leaves_green"}) then

			dir = math.random(1, 80)

			    if dir == 1 then pos.x = pos.x + 1
			elseif dir == 2 then pos.x = pos.x - 1
			elseif dir == 3 then pos.z = pos.z + 1
			elseif dir == 4 then pos.z = pos.z -1
			end

			if dir < 5
			and minetest.get_node(pos).name == "air"
			and minetest.get_node_light(pos) > 12 then

--print ("Cocoa Pod added at " .. minetest.pos_to_string(pos))

				minetest.swap_node(pos, {
					name = "hades_extrafarming:cocoa_" .. tostring(math.random(4))
				})
			end
		end
	end
end)
--]]
