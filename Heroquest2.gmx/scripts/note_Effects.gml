/***** EFFECTS *****

=======
EFFECTS
=======
(~) = subject to modifiers



COLD
-----
Gives target a number of cold tokens equal to the spell level.

Rules:
  Every turn an entity warms up towards their natural warmth level.
  Cold affected entities are given cold tokens. The more tokens, the more severe the effects on stats.
  Cold tokens are cumulative, so you can keep blasting an enemy with a cold inducing spell and the effects are amplified.
  When an entity has lost all movement they become frozen.

Cold token rules:
  -1 dexterity for every 1 token
  -1 movement for every 3 tokens
  e.g. A level 6 cold spell would isntantly give -6 to dexterity and -2 to move.(~)
       3 tokens would be -3 dex, -1 move speed
       2 tokens would be -2 dex, -0 move speed




FREEZE
------
Prevents all actions.
Massively increases weakness to blunt damage.
Frozen entities are frozen for a number of turns equal to the level of the effect(~).

Rules:
  Every turn, frozen entities lose 1 freeze token.
  Entities that become unfrozen still suffer from cold tokens and will be slower and less dexterous.
  The die size is equal to the level of shock effect (probably the same level as the causing spell).
  The die size is further modified by resistances and bonuses, etc.
  Rolling the max number will end the shock.
  Every turn the max number is reduced by 1 (depending on modifiers).




SHOCK
------
Prevents all actions.

Rules:
  Shocked entities roll every turn to see if they are still shocked.
  The die size is equal to the level of shock effect (probably the same level as the causing spell)(~).
  Rolling the max number will end the shock.
  Every turn the max number is reduced by 1 (depending on modifiers).


