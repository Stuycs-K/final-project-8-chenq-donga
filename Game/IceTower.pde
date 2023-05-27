public class IceTower extends Tower {
  //ice tower is associated with key 2
  //set damage to medium, cooldowntime medium, range medium for ice towers. 
  //(ADD AFTER game works) special abilities could be a freeze ability that the user could press on the screen to freeze the entire map for a few seconds
  //upgrades would be bigger range, shorter cooldowntimes, and higher damage
  
  public void highlight() {
    //change in the color to blue for the enemy
  }
  
  //similar to fire tower
    public void IceAbility(enemy ene) {
    //check for enemies in range, if in range, change highlight to red after
    //fire sprite appears.
    if (inrange()) {
      highlight();
      //create a sprite for just an icy zone that lasts for a few seconds, or something similar. If unable, then just create a ice circle. 
      createIce();
      //call damage on the enemies, i guess?
      ene.losehealth(damage);
    }
  }
  
  //needs to create an in range function, make this in parent tower class probably 
  
  public void upgrades(boolean hasMoney) {
    damage += damage/3;
    range++;
    cooldownTime--;
  }
  //might need to fix the upgrades so that the abilities and stuff are also included. 
  
  public void createIce() {
    //add in a sprite around the tower using its location....?
  }
  
}public class IceTower extends Tower {
  //ice tower is associated with key 2
  //set damage to medium, cooldowntime medium, range medium for ice towers. 
  //(ADD AFTER game works) special abilities could be a freeze ability that the user could press on the screen to freeze the entire map for a few seconds
  //upgrades would be bigger range, shorter cooldowntimes, and higher damage
  
  public void highlight() {
    //change in the color to blue for the enemy
  }
  
}
