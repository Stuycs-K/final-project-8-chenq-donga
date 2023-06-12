public class Tower {
  private float damage;
  private float cooldownTime; // measured in frames
  private int range;
  private int xcoord;
  private int ycoord;
  private int towerLevel;
  private int maxEnemiesAttacked;
  private int maxTowerLevel;
  private int upgradeCost;
  
  PImage BlueTower = loadImage("BlueTowerTestingTwo.png");
  PImage BlueTowerUp = loadImage("BlueTowerLevelTwo.png");
  //testing
  
  public Tower(float dmg, float cd, int rng, int x, int y, int maxEnemies) {
    damage = dmg;
    cooldownTime = cd;
    range = rng;
    fixXY(x, y);
    maxEnemiesAttacked = maxEnemies;
    maxTowerLevel = 4;
    towerLevel = 1;
    upgradeCost = 75;
  }
  
  public void fixXY(int x, int y) {
     int gridX = x / 60;
     int gridY = y / 60;
     xcoord = (gridX * 60) + 15;
     ycoord = (gridY * 60) + 15;
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
  
  public void evolve(String input) {
    if (towerLevel < maxTowerLevel) {
      towerLevel++;
      if (input.equals("s")) {
        damage = 10;
        range = range * 2;
        cooldownTime = cooldownTime * 1.5;
        maxEnemiesAttacked = 1;
      }
      else if (input.equals("m")) {
        damage = 1;
        range = (int)(range * 0.65);
        cooldownTime = cooldownTime * 0.35;
        maxEnemiesAttacked = 6;
      }
    }
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

  public int upgrades() {
    //check 
    if (towerLevel < maxTowerLevel - 1) {
      increaseCost();
      towerLevel++;
      damage++;
      range += 25;
      cooldownTime -= 10;
      //add a certain amount to damage, probably needs to be overridden.
      //add a certain amount to range, or subtract.
      //change cooldowntime based on type
      //change money as well
      //reduce the money based on what level the tower's on
      //or just a set amount each time for each upgrade.
      return upgradeCost / 3;
    }
    return 0;
  }
  
  public void increaseCost() {
     upgradeCost = upgradeCost * 3; 
  }
  
  public int getUpgradeCost() {
     return upgradeCost; 
  }
  
  public void displayTower() {
    fill(0);
    textSize(13);
    text("Level: " + towerLevel, xcoord - 7, ycoord - 2);
    image(BlueTower, xcoord, ycoord);  
  }
  
    public float getDamage() {
     return damage; 
  }
  
  public float getCD() {
     return cooldownTime; 
  }
  
  public int getMax() {
    return maxEnemiesAttacked; 
  }
  
  public int[][] getRange() {
    int[] v1 = new int[]{xcoord-range, ycoord-range};
    int[] v2 = new int[]{xcoord+range, ycoord-range};
    int[] v3 = new int[]{xcoord-range, ycoord+range};
    int[] v4 = new int[]{xcoord+range, ycoord+range};
    return new int[][]{v1, v2, v3, v4};
  }
  
  public int getNumRange() {
    return range; 
  }
  
  public int getLevel() {
    return towerLevel; 
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
