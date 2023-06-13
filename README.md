# APCS Final Project
THIS DOCUMENT IS REQUIRED

## Group Info
Group Name: Everyone Al-an for practicing Dong-fu?

Group Members: Ashton Dong, Quiyi Chen

## Overview
This is a tower defense game, where you place towers to defend against enemies. Towers have a set range in which they will attack enemues, and do a set amount of damage. They have the ability to be upgraded twice, and an evolution that can be bought after upgrading twice.

The base tower(always hit 3 enemies) increases in range and damage, as well as a small increase in attack speed when upgraded. When evolved to the minigun, damage is significantly reduced, and range is slightly reduced, but attack speed is significantly increased, as well as the amount of enemies that can be targeted at once. When evolved into a sniper, attack speed is increased and it can only attack one enemy, but damage is significantly increased.

Enemies have a speed stat, which will make them move faster if it is higher. Health is higher(on average) after each wave has passed, and every 5 waves, there will be a miniboss. 

Winning the game is accomplished by beating wave 20.


## Instructions
 - Left Click to place tower.
 - `u` to upgrade a tower while hovering over it.
 - `m` or `s` to evolve into minigun or sniper, respectively.
 - Press spacebar to restart when you lose.
 - If you forget these instructions, there is also an instruction list on the side of the game when you load it up.

## DEV LOGS

### Development related
- adding range highlighting was easier than expected
- adding a cap to how many enemies can be attacked from a tower wasn't that hard
- the amount of functions that had to be made to get stuff from a class was a lot

### Game Related
WORKING FEATURES:
- Tower placing snaps to a singular grid.
- Towers can be upgraded.
- Tower upgrading costs are scaled proportionally.
- Towers can evolve further.
- Sprites for each special boss, tower, and normal enemies.
- Hovering over the tower shows you the range of the tower.
- Enemies spawn in waves, each with a random amount of hp.
- Minibosses and bosses can spawn in.
- Player loses if health reaches 0. 

EASTER EGGS:
- Players can spawn in infinite money, if they have their mouse cursor over the red rectangle with the instructions and press the `m` key.
- Players can spawn in a special boss with a sprite that's based on Mr. Konstantinovich. The player will lose immediately. 

BUGS: 
- The players can evolve their towers immediately, if they have enough money. By evolving immediately, the player can have a significantly stronger tower. To do this, the player must hover over a tower, and press either `s` or `m` to evolve their level 1 tower. This can keep going until the tower reaches level 4. 

USEFUL RESOURCES: 
- We took inspiration from the game BTD6 (Balloons Tower Defense 6), with the ideas of popping balloons and blimps. 
