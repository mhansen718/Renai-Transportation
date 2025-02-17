local TheItem = table.deepcopy(data.raw.item.inserter)
	TheItem.icon = "__RenaiTransportation__/graphics/primerthrowericon.png"
	TheItem.name = "RTThrower-PrimerThrower-Item"
	TheItem.subgroup = "defensive-structure"
   TheItem.order = "b-a-b"
	TheItem.place_result = "RTThrower-PrimerThrower"

TheRecipe =
	{
		type = "recipe",
		name = "RTThrower-PrimerThrower-Recipe",
		enabled = false,
		energy_required = 1,
		ingredients =
			{
				{"electronic-circuit", 2},
				{"PrimerBouncePlateItem", 2},
				{"gun-turret", 1},
				{"inserter", 1}
			},
		result = TheItem.name
	}

TheThrower = table.deepcopy(data.raw.inserter.inserter)
	TheThrower.name = "RTThrower-PrimerThrower"
	TheThrower.minable = {mining_time = 0.1, result = TheItem.name}
	TheThrower.insert_position = {0, 0.8}
	TheThrower.allow_custom_vectors = false
   TheThrower.draw_inserter_arrow = false
   TheThrower.rotation_speed = 0.018

   TheThrower.radius_visualisation_specification =
      {
         sprite =
            {
               filename = "__RenaiTransportation__/graphics/PrimerThrower.png",
               size = 570
            },
         draw_on_selection = true,
         draw_in_cursor = true,
         distance = 45
      }

	if (TheThrower.energy_per_rotation) then
		TheThrower.energy_per_movement = "1J" -- this prevents inserters from elongating first and then rotating when energy is low
	end
	local HandTint = {r=0.9, g=0.4, b=0.5, a=1}
	TheThrower.hand_size = 0
	TheThrower.hand_base_picture =
		{
		filename = "__RenaiTransportation__/graphics/ThrowerInserter/hr-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25,
		  tint = HandTint
		}
	TheThrower.hand_closed_picture =
		{
		filename = "__RenaiTransportation__/graphics/ThrowerInserter/hr-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		  tint = HandTint
		}
	TheThrower.hand_open_picture =
		{
		filename = "__RenaiTransportation__/graphics/ThrowerInserter/hr-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25,
		  tint = HandTint
		}
	TheThrower.platform_picture =
		{
		  sheet =
		  {
			 filename = "__base__/graphics/entity/burner-inserter/burner-inserter-platform.png",
			 priority = "extra-high",
			 width = 46,
			 height = 46,
			 shift = {0.09375, 0},
			 hr_version =
			 {
				filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-platform.png",
				priority = "extra-high",
				width = 105,
				height = 79,
				shift = util.by_pixel(1.5, 7.5-1),
				scale = 0.5
			 }
		  }
		}
data:extend({TheThrower, TheItem, TheRecipe})
