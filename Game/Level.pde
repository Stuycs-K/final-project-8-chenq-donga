public class Level {
  private Waves enemyWaves;
  private int[][] gameBoard;
  private Map gameMap;
  private int maxWave;
  private int currentWave;
  private int health; // drops when enemies cross the end
  private int money; // amount of money that the player has
  private ArrayList<Tower> towers;
  private ArrayList<Enemy> enemies;
  private int[] start;
  private int[] end; 
  private int towerIndex;
  
  private final int path = -1;
  
  public Level(String name) { // normal constructor used in normal games
    maxWave = 20;
    enemyWaves = new Waves(20, 1);
    currentWave = 1;
    gameBoard = new int[(width - 300)/60][height/60];
    start = new int[]{0, 4};
    end = new int[]{gameBoard.length - 1, 4};
    gameMap = new Map(name, start, end);
    waypoints();
    setPath();
    towers = new ArrayList<Tower>();
    enemies = new ArrayList<Enemy>();
    health = 20;
    money = 500;
    towerIndex = 0;
  }
  
  public Level(String name, int hp, int mulah) { // cheat constrctor for demo cases
    enemyWaves = new Waves(20, 1);
    currentWave = 1;
    gameBoard = new int[width/60][height/60];
    gameMap = new Map(name, new int[]{0, 4}, new int[]{gameBoard.length - 1, 4});
    towers = new ArrayList<Tower>();
    enemies = new ArrayList<Enemy>();
    health = hp;
    money = mulah;
  }
  /* THIS PART OF THE CODE HANDLES THE PATH AND WHERE ENEMIES SHOULD GO
     CURRENTLY INCLUDES:
      - adding waypoints, setting the path on the int[][], and a helper method
  */
  public void waypoints() {
    addWaypoint(new int[]{3, 4});
    addWaypoint(new int[]{3, 10});
    addWaypoint(new int[]{11, 10});
    addWaypoint(new int[]{11, 4});
  }
  
    public void addWaypoint(int[] cord) {
    gameMap.addWaypoint(cord);
  }

  public void setPath() {
     gameBoard[start[0]][start[1]] = -1;
     int currentX = start[0];
     int currentY = start[1];
     int[] nextLocation = null;
     while (gameMap.getSize() >= 1) {
        nextLocation = gameMap.nextLocation();
        gameBoard[nextLocation[0]][nextLocation[1]] = -1;
        for (int i = currentX; i < nextLocation[0]; i++) {
          if (currentY < nextLocation[1]) {
            for (int j = currentY; j <= nextLocation[1]; j++) {
              gameBoard[i][j] = path;
            }
          } else {
            for (int j = currentY; j >= nextLocation[1]; j--) {
              gameBoard[i][j] = path;
            }
          }
        currentX = nextLocation[0];
        currentY = nextLocation[1];
       }
    }
  }
  
  /* THIS PART INCLUDES ALL THE CODE THAT HAS THE GAME LOGIC
     CURRENTLY INCLUDES: 
       - attacking
       - placing tower(and helper for using up money)
       - losing health
       - checking for a win
  */
 
  public void attack() {
     for (int i = 0; i < towers.size(); i++) {
       Tower tower = towers.get(i);
       int currentAttacked = 0;
       int maxEnemies = tower.getMax();
       for (int j = 0; j < enemies.size() && currentAttacked < maxEnemies; j++) {
          Enemy enemy = enemies.get(j);
          if (enemy.loseHealth(tower.getDamage(), tower.getRange())) {
            currentAttacked++;
            fill(255, 0, 0);
            //change sprite
            PImage deadEnemy = loadImage("RedBalloonEnemyPopping.png");
            if (enemy.getHealth() < 10000) {
              image(deadEnemy, enemy.getX(), enemy.getY());
              text("POP!", enemy.getX(), enemy.getY() - 15);
            }
          }
       }
     }
     removeDeadEnemies();
  }
  
  
  
  // will be called from mouseCLicked function, x and y will the mouseX, mouseY
  public void placeTower(int x, int y, int towerCost, int towerType) {
    int maxEnemies = 3;
    if (money >= towerCost && canPlace(x, y)) {
      useMoney(towerCost);
      gameBoard[x/60][y/60] = towerIndex + 1;
      towerIndex++;
      towers.add(new Tower(1, 100, 100, x, y, maxEnemies)); // will change stats later
    }
  }
  
  public void evolveTower(int x, int y, String type) {
    if (gameBoard[x/60][y/60] >= 1) {
      Tower toEvolve = towers.get(gameBoard[x/60][y/60] - 1);
      if (money >= toEvolve.getUpgradeCost()) {
         useMoney(toEvolve.getUpgradeCost()); 
         toEvolve.evolve(type);
      }
    }
  }
  
  public boolean canPlace(int x, int y) {
     if (gameBoard[x/60][y/60] == 1) {
       return false; 
     }
    return true;
  }
  
  public void upgradeTower(int x, int y) {
    if (gameBoard[x/60][y/60] >= 1) {
      Tower tower = towers.get(gameBoard[x/60][y/60] - 1);
      if (money >= tower.getUpgradeCost()) {
         int cost = tower.upgrades();
         useMoney(cost);
      } 
    }
  }
  
  public void setWave(int wave) {
     currentWave = wave; 
  }
  
  // cheat method
  public void setMoney() {
     money = 9999999;
  }
  
  public void useMoney(int moneyUsed) {
    money = money - moneyUsed;
  }
  
  public void loseHP() { // Eventually different enemies will cause different amount of health loss
    health--; 
  }
  
  public boolean isWon() {
    if (currentWave == maxWave && enemyWaves.waveFinished()) {
       return true; 
    }
    return false;
  }
  
  public void nextWave() {
    currentWave++;
    enemyWaves = new Waves(20 + (int)(Math.random() * currentWave), currentWave);
  }
  
  /* THIS PART IS ALL GETTER METHODS
     CURRENTLY INCLUDES;
      - getting the grid(int[][]), money, health, towers, enemies, and waves, as well as current wave
  */
  public int[][] getBoard() {
    return gameBoard;
  }
 
  public int getMoney() {
    return money;
  }
  
  public int getHealth() {
    return health; 
  }
  
  public ArrayList<Tower> getTowers() {
    return towers; 
  }
  
  public ArrayList<Enemy> getEnemies() {
    return enemies; 
  }
  
  public int getCurrentWave() {
     return currentWave; 
  }
  
  public Waves getWaves() {
    return enemyWaves; 
  }
  
  public int getTowerIndex() {
    return towerIndex;
  }
  
  /* THIS PART OF THE CODE FOR ENEMY RELATED FUNCTIONS
     CURRENTLY INCLUDES:
        - removing dead enemies
        - moving the enemies and the helper method required for enemies to change directions
        - checking if an enemy is at the end, which will cause the player to lose health
        - debug enemy spawning, one at mouse with preloaded stats, and one in the given start square and/or bosses
  */
  public void removeDeadEnemies() {
    for (int i = 0; i < enemies.size(); i++) {
       Enemy enemy = enemies.get(i);
       if (enemy.dropMoney() == 25) {
         money += 25;
         enemies.remove(i);
         i--; // Decrement i to account for the removed enemy
      }
    }
  } 
  
    public void enemyMove() {
    enemyAtEnd();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      int currentX = enemy.getX();
      int currentY = enemy.getY();
      String currentDirection = enemy.getDirection();
      int nextX = currentX;
      int nextY = currentY;
      if (currentDirection.equals("right")) {
        nextX = currentX + 30;
      } else if (currentDirection.equals("down")) {
        nextY = currentY + 30;
      } else if (currentDirection.equals("up")) {
        nextY = currentY - 30;
      }
      if (gameBoard[nextX / 60][nextY / 60] == -1) {
        enemy.move();
      } else {
        String newDirection = getNewDirection(gameBoard, currentX, currentY);
        enemy.setDirection(newDirection);
        enemy.move();
      }
    }
  }

  private String getNewDirection(int[][] gameBoard, int currentX, int currentY) {
    int distance = 30; // Desired distance from the edge
    if (gameBoard[(currentX + distance) / 60][currentY / 60] == -1) {
      return "right";
    } else if (gameBoard[currentX / 60][(currentY + distance) / 60] == -1) {
      return "down";
    } else if (gameBoard[currentX / 60][(currentY - distance) / 60] == -1) {
      return "up";
    }
    // If no valid direction is found, default to right
    return "right";
  }  
  
  public void enemyAtEnd() {
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      int currentX = enemy.getX();
      if (currentX >= end[0]*61) {
        enemies.remove(i);
        if (enemy.getHealth() < 10000) {
          health = health - (int)(enemy.getHealth());
        }
        else if (enemy.getHealth() > 10000) {
          health = 0;
        }
        i--; // Decrement i to account for the removed enemy
      }
    }
  }
  
 // debug, used to test tower attacks
  public void spawnEnemyDebug(int x, int y) {
    enemies.add(new Enemy(1, 10, x, y, false)); //placeholder values
  }
  
  // for special enemies
  public void spawnEnemy(int hp, int speed) {
    int spawnX = start[0]*60 + 30;
    int spawnY = start[1]*60 + 30;
    boolean isBoss = (hp > 1000);
    enemies.add(new Enemy(hp, speed, spawnX, spawnY, isBoss)); //placeholder values
  }
}
