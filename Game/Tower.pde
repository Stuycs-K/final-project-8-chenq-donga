public class Tower {
  private float damage;
  private float cooldownTime;
  private int range;
  private int attacksbtwabilities;
  private int xcoord;
  private int ycoord;
  private int TowerLevel;
  
  PImage goblinBomber = loadImage("New Piskel.png");
  //testing
  //image(goblinBomber, 50, 50);
  
  public Tower(float dmg, float cd, int rng, int aba, int x, int y) {
    damage = dmg;
    cooldownTime = cd;
    range = rng;
    attacksbtwabilities = aba;
    xcoord = x;
    ycoord = y;
  }
  
  public int[][] towerRangeVertices() {
    int[] v1 = new int[]{xcoord-range, ycoord-range};
    int[] v2 = new int[]{xcoord+range, ycoord-range};
    int[] v3 = new int[]{xcoord-range, ycoord+range};
    int[] v4 = new int[]{xcoord+range, ycoord+range};
    return new int[][]{v1, v2, v3, v4};
  }
  
  public float returncdt() {
    return cooldownTime;
  }
  
  
  //public boolean enemyinrange() {
  //  //if theres any enemies in range, whichever is closest to the next node then return that
  //  //otherwise return null.
  //  //change the for loop, we hard coded this.
  //  for (int i = xcoord - range; i < x + range && (i > 0 && i < 18); i++) {
  //    for (int j = ycoord - range; j < ycoord + range && (j > 0 && j < 15); j++) {
  //      if (grid[i][j] == -2) {
  //        return 
  //      }
  //    }
  //  }
  //  return null;
  //}
  
  /*5/25/23 
  THESE METHODS WILL BE CALLED IN LEVEL, WHERE CHECKING THE ENEMIES IN RANGE WOULD BE COMPLETED
  */
  public void attacking(Enemy ene) {
    ene.losehealth(damage);
      //hightlight();
  }
  
  public int upgrades(boolean hasMoney) {
    //check 
    if (hasMoney) {
      TowerLevel++;
      damage++;
      range++;
      cooldownTime--;
      //add a certain amount to damage, probably needs to be overridden.
      //add a certain amount to range, or subtract.
      //change cooldowntime based on type
      //change money as well
      //reduce the money based on what level the tower's on
      //or just a set amount each time for each upgrade.
      return (TowerLevel * 5);
    }
    return 0;
  }
  
  public void displayTower() {
    image(goblinBomber, xcoord, ycoord);  
  }
  
    public float getDamage() {
     return damage; 
  }
  
  public float getCD() {
     return cooldownTime; 
  }
  
  public int[][] getRange() {
    int[] v1 = new int[]{xcoord-range, ycoord-range};
    int[] v2 = new int[]{xcoord+range, ycoord-range};
    int[] v3 = new int[]{xcoord-range, ycoord+range};
    int[] v4 = new int[]{xcoord+range, ycoord+range};
    return new int[][]{v1, v2, v3, v4};
  }
  
  public int getLevel() {
    return TowerLevel; 
  }
  
  //public void highlight() {
  //  /* change the color of the enemy, so just load in a new image in the current place of the enemy
  //  call losehealth
  //  */
    
  //}
  
  
  
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
  */
}
