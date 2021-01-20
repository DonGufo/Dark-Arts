--local sounds = require ("__base__prototypes.entity.sounds")
require ("prototypes.projectiles")

function focus(data)
  return
  {
    type = "capsule",
    name = data.name,
    localised_name = data.localised_name,
    localised_description = data.description,
    icons = {
      {
      icon = "__base__/graphics/icons/uranium-235.png",
      tint = data.color
      },
    },
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
  {
    type = "throw",
    uses_stack = 0,
    attack_parameters =
    {
      type = data.type,
      activation_type = "throw",
      ammo_category = "D-elemental-magic",
      cooldown = data.cooldown,
      projectile_creation_distance = 0.5,
      range = data.range,
      ammo_type =
      {
        category = "D-elemental-magic",
        target_type = data.target_type,
        action =
        {
          {
            type = "direct",
            ["action_delivery"] = data.action_delivery
            
          },

        }
      }
    }
  },
  radius_color = data.color,
  subgroup = "capsule",
  order = "a[grenade]-a[normal]",
  stack_size = 1
}
end


                -- Firebal

local fireball_focus = focus(
  {
    name = "fireball_focus",
    localised_name = "Fireball",
    color = { r = 0.75, g = 0.05, b = 0.05, a = 0.20 },
    cooldown = 20,
    range = 40,
    type = "projectile",
    target_type = "position",
    action_delivery =
    {
      type = "projectile",
      projectile = "fireball-small",
      starting_speed = 1
    }
  })



-- Projectile
--local fireball_small = table.deepcopy(data.raw.projectile.grenade)
--fireball_small.name = "fireball-small"
--fireball_small.acceleration = 0.01
--fireball_small.action[2].radius = 6
--fireball_small.action[2].action_delivery.target_effects[1].damage.amount = 35
--fireball_small.action[2].action_delivery.target_effects[1].damage.type = "fire"
--fireball_small.action[2].action_delivery.target_effects[2].entity_name = "fire-flame"
--fireball_small.action[1].action_delivery.target_effects[1].entity_name = "fire-flame"

                -- Acid Jet

local Acid_focus =  focus(
  {
    name = "D_acid_jet",
    localised_name = "Acid Jet",
    description = "20 Mana",
    color = { r = 0.05, g = 0.75, b = 0.05, a = 0.20 },
        cooldown = 20,
    range = 40,
    type = "stream",
    target_type = "position",
    action_delivery =
    {
      type = "stream",
      stream = "acid-stream-spitter-small"
    }
  })



  local lightning_focus =  focus(
  {
    name = "D_lightning",
    localised_name = "Lightning Bolt",
    description = "20 Mana",
    color = { r = 0.05, g = 0.25, b = 0.75, a = 0.20 },
    cooldown = 20,
    range = 40,
    type = "beam",
    target_type = "position",
    action_delivery =
    {
      type = "beam",
      beam = "electric-beam",
      max_length = 40,
      duration = 20,
      source_offset = {0.15, -0.5}
    }
  })

                -- magic missile

  local missile_focus = focus(
    {
      name = "missile_focus",
      localised_name = "Magic Missile",
      description = "50 Mana",
      color = { r = 0.05, g = 0.05, b = 0.05, a = 0.20 },
      cooldown = 30,
      range = 40,
      type = "projectile",
      target_type = "entity",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = {{0, 1}}
          },
          {
            type = "damage",
            damage = { amount = 20, type = "physical"}
          }
        }
      }
    })


  local tree_focus = focus(
    {
      name = "tree_focus",
      localised_name = "Summon Tree",
      description = "50 Mana",
      color = { r = 0.05, g = 0.85, b = 0.05, a = 0.20 },
      cooldown = 20,
      range = 40,
      type = "projectile",
      target_type = "position",
      action_delivery =
    {
      type = "instant",
      target_effects =
      {
        type = "create-entity",
        entity_name = "tree-01",
        check_buildability = true,
        show_in_tooltip = true
      }
    }
    })


data:extend({
  fireball_focus,
  --fireball_small,
  Acid_focus,
  lightning_focus,
  missile_focus,
  tree_focus
})