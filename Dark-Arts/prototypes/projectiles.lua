data:extend(
{
  {
    type = "projectile",
    name = "fireball-small",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "fire-flame"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 6 -- large radius for demostrative purposes
            }
          }
        }
      },
      {
        type = "area",
        radius = 6,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 30, type = "fire"}
            },
            {
              type = "create-entity",
              entity_name = "fire-flame"
            }
          }
        }
      }
    }
  }
}
)