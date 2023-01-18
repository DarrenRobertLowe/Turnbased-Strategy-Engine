///melee_attack(source id, target id)

attacker = argument0;
target   = argument1;

sout("attacker: " +string(attacker) + "    target: "+ string(target));


debug_message(string(attacker.name)
  + " is attacking "
  + string(target.name)
  + " with their "
  + string(attacker.weapon.name)
  + "!");
  

damage = roll(attacker.weapon.dice, attacker.weapon.pwr);

sout("Did " + string(damage) + " damage to HP!");
