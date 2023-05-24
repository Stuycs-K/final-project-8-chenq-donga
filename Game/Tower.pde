public class Tower {
  public float damage;
  public float cooldownTime;
  public float range;
  public int numberofatks;
  
    public Tower(float dmg, float cd, float rng, int numoatks) {
    damage = dmg;
    cooldownTime = cd;
    range = rng;
    numberofatks = numoatks;
  }
  
  public float returncdt() {
    return cooldownTime;
  }
  
  
  public Enemy enemyinrange() {
    //if theres any enemies in range, whichever is closest to the next node then return that
    //otherwise return null.
    return null;
  
  public void attacking() {
    Enemy attacked = enemyinrange();
    if (attacked != null) {
      
      circle(x, y, 
      hightlight();
    }
    
  }
  
  public void highlight() {
    /* change the color of the enemy, so just load in a new image in the current place of the enemy
    call losehealth
    */
    
  }
  
  
  
  /*
  ATTACKING - Adds in a little circle around the targetted enemy
  after circling the targetted enemy, changes the color of the enemy red for a certain
  duration, (blinking)
  
  PLACING DOWN TOWERS - Hot keys and mouse tracking
  for hot keys, each tower could be assigned a specific number on your keyboard,
  like a fire tower being key 1 on your keyboard, ice tower being key 2, etc
  for mouse tracking, you could click once on the tower, and then click again on the map, to place down tower
  
  big game class, towers snap to a grid
  map be a 2d array of tiles
  towers plaed on tiles, either tower friendly or not
  certain tiles are path that enemies follow
  different nodes for path tiles that enemies follow so making maps would be easy
  
}
