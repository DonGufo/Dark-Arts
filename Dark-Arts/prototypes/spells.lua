data:extend(
{
    type = "capsule",
    name = "frieball",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "D-elemental-magic",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "D-elemental-magic",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "fire-ball-small",
                starting_speed = 0.3
              }
            }
          }
        }
      }
    },
    radius_color = { r = 0.75, g = 0.05, b = 0.25, a = 0.25 },
    order = "a-a",
    stack_size = 1
  }

)