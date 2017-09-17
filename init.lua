minetest.register_craftitem("bandage:medkit", {
	description = "Medkit",
	inventory_image = "medkit.png",
	on_use = function(itemstack, user, pointed_thing)
		local hp = user:get_hp()
		if hp ~= 20 then
			user:set_hp(hp + 18)
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_craft({
	output = "bandage:medkit",
	recipe = {
		{"dye:red", "farming:cotton", "dye:red"},
		{"", "default:steel_ingot", ""},
		{"", "", ""},
	}
})

minetest.register_on_player_hpchange(function(player, hp_change)
	if not player then
		return
	end
	if hp_change >= 0 then
		return hp_change
	end
	local hp = player:get_hp()
	if hp + hp_change < 4 and hp + hp_change > 0 then
		for i, v in pairs(player:get_inventory():get_list("main")) do
			if i <= 8 then
				if v:get_name() == "bandage:medkit" then
					minetest.chat_send_player(player:get_player_name(), "Medkit gave you health!")
					v:take_item(1)
					player:get_inventory():set_stack("main", i, v)
					hp_change = hp_change + 2
				end
			end
		end
	end
	return hp_change
end, true)
---
minetest.register_craftitem("bandage:bandage", {
	description = "Bandage",
	inventory_image = "bandage.png",
	on_use = function(itemstack, user, pointed_thing)
		local hp = user:get_hp()
		if hp ~= 20 then
			user:set_hp(hp + 5)
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_craft({
	output = "bandage:bandage",
	recipe = {
		{"default:paper", "farming:string", "default:paper"}
	}
})

minetest.register_on_player_hpchange(function(player, hp_change)
	if not player then
		return
	end
	if hp_change >= 0 then
		return hp_change
	end
	local hp = player:get_hp()
	if hp + hp_change < 4 and hp + hp_change > 0 then
		for i, v in pairs(player:get_inventory():get_list("main")) do
			if i <= 8 then
				if v:get_name() == "bandage:medkit" then
					minetest.chat_send_player(player:get_player_name(), "Bandage gave you health!")
					v:take_item(1)
					player:get_inventory():set_stack("main", i, v)
					hp_change = hp_change + 2
				end
			end
		end
	end
	return hp_change
end, true)
