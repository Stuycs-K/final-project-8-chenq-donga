public class Lightning extends Tower {
  //lightning tower is associated with key 3
  //set damage to medium, cooldowntime medium, range medium for ice towers. 
  //(ADD AFTER game works) special abilities could be a freeze ability that the user could press on the screen to freeze the entire map for a few seconds
  //upgrades would be bigger range, shorter cooldowntimes, and higher damage
  //information needs to be changed from icetower!!!!!
  
  public void highlight() {
    //change in the color to yellow for the enemy
  }
  
  //similar to fire tower
    public void ShockAbility(enemy ene) {
    //check for enemies in range, if in range, change highlight to red after
    //fire sprite appears.
    if (inrange()) {
      highlight();
      //
      //change the sprites of the enemies to yellowish? or normal
      //cause them to be paralyzed
      paralyze();
      //stop them from moving for a few seconds?
      //or should the enemies just die immediately.. hmm
      //call damage on the enemies, i guess?
      ene.losehealth(damage);
    }
  }
  
  //needs to create an in range function, make this in parent tower class probably 
  
  public void upgrades(boolean hasMoney) {
    damage += damage;
    range++;
    cooldownTime--;
  }
  //might need to fix the upgrades so that the abilities and stuff are also included. 
  
  public void lightningEffects() {
    //perhaps with the enemies, I stop them from moving and then just
    //add in a flash of yellow every once in a while, will decide later.
  }
  
}
