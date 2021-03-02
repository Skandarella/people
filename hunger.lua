if minetest.get_modpath("hunger_ng") ~= nil then
hunger_ng.add_hunger_data('people:mutton_raw', {
		satiates = 1.0,
	})
	hunger_ng.add_hunger_data('people:mutton_cooked', {
		satiates = 3.0,
	})
	hunger_ng.add_hunger_data('people:dogfood', {
		satiates = 1.0,
	})
	hunger_ng.add_hunger_data('people:dogfood_cooked', {
		satiates = 3.0,
	})
	hunger_ng.add_hunger_data('people:bandage', {
		heals = 20.0, 
})
end