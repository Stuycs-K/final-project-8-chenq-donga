public class FireTower extends Tower {
  //fire tower is associated with key 1
  //set damage to higher, cooldowntime higher, range lower for fire towers. 
  //(ADD AFTER game works) special abilities could be a continuous flame thrower that deals damage every second instead of having a cooldowntime
  //upgrades would be bigger range, shorter cooldowntimes, and higher damage
  
  public void highlight() {
    //change in the color to red for the enemy
  }
  
  public void FireAbility(enemy ene) {
    //check for enemies in range, if in range, change highlight to red after
    //fire sprite appears.
    if (inrange()) {
      highlight();
      //create a sprite for a ring of fire, or something similar. If unable, then just create a red circle. 
      createFire();
      //call damage on the enemies, i guess?
      ene.losehealth(damage);
    }
  }
  
  //needs to create an in range function, make this in parent tower class probably 
  
  public void upgrades(boolean hasMoney) {
    damage += damage/2;
    range++;
    cooldownTime--;
  }
  //might need to fix the upgrades so that the abilities and stuff are also included. 
  //for upgrades might need to add something that counts the upgrades, so that the upgrades are able to be seen along with the sprites
  
    public void createFire() {
    //add in a sprite around the tower using its location....?
  }
  
}
