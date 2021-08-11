-- added for Hades Revisited supoort

local orig_groups = table.copy(minetest.registered_items["hades_core:sugar"].groups);
orig_groups.food_sugar = 1;
minetest.override_item("hades_core:sugar", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_farming:flour"].groups);
orig_groups.food_wheat = 1;
minetest.override_item("hades_farming:flour", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_farming:tomato"].groups);
orig_groups.food_tomato = 1;
minetest.override_item("hades_farming:tomato", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_farming:potato"].groups);
orig_groups.food_potato = 1;
minetest.override_item("hades_farming:potato", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_farming:strawberry"].groups);
orig_groups.food_strawberry = 1;
minetest.override_item("hades_farming:strawberry", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:apple"].groups);
orig_groups.food_apple = 1;
minetest.override_item("hades_trees:apple", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:orange"].groups);
orig_groups.food_orange = 1;
minetest.override_item("hades_trees:orange", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:olive"].groups);
orig_groups.food_olive = 1;
minetest.override_item("hades_trees:olive", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:cocoa_bean"].groups);
orig_groups.food_cocoa = 1;
minetest.override_item("hades_trees:cocoa_bean", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:coconut"].groups);
orig_groups.food_coconut = 1;
minetest.override_item("hades_trees:coconut", {
  groups = orig_groups,
})

local orig_groups = table.copy(minetest.registered_items["hades_trees:banana"].groups);
orig_groups.food_banana = 1;
minetest.override_item("hades_trees:banana", {
  groups = orig_groups,
})

