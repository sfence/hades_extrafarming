
for i = 4, 5 do

	-- Override default grass and have it drop Wheat and Oat Seeds

	minetest.override_item("default:grass_" .. i, {
		drop = {
			max_items = 1,
			items = {
				{items = {"hades_extrafarming:seed_wheat"}, rarity = 5},
				{items = {"hades_extrafarming:seed_oat"},rarity = 5},
				{items = {"default:grass_1"}}
			}
		}
	})

	-- Override default dry grass and have it drop Barley and Rye Seeds

	if minetest.registered_nodes["default:dry_grass_1"] then

		minetest.override_item("default:dry_grass_" .. i, {
			drop = {
				max_items = 1,
				items = {
					{items = {"hades_extrafarming:seed_barley"}, rarity = 5},
					{items = {"hades_extrafarming:seed_rye"},rarity = 5},
					{items = {"default:dry_grass_1"}}
				}
			}
		})
	end

end

-- Override default Jungle Grass and have it drop Cotton and Rice Seeds

minetest.override_item("hades_core:junglegrass", {
	drop = {
		max_items = 1,
		items = {
			{items = {"hades_extrafarming:seed_cotton"}, rarity = 8},
			{items = {"hades_extrafarming:seed_rice"},rarity = 8},
			{items = {"hades_core:junglegrass"}}
		}
	}
})
