public class Level {
  private int[][] gameBoard;
  private Map gameMap;
  private int health; // drops when enemies cross the end
  private int money; // amount of money that the player has
  private ArrayList<Tower> towers;
  private ArrayList<Enemy> enemies;
  private int[] start;
  private int[] end; 
  
  private final int path = -1;
  
  public Level(String name) { // normal constructor used in normal games
    gameBoard = new int[width/60][height/60];
    start = new int[]{0, 4};
    end = new int[]{gameBoard.length - 1, 4};
    gameMap = new Map(name, start, end);
    waypoints();
    setPath();
    towers = new ArrayList<Tower>();
    enemies = new ArrayList<Enemy>();
    health = 20;
    money = 250;
  }
  
  public Level(String name, int hp, int mulah) { // cheat constrctor for demo cases
    gameBoard = new int[width/60][height/60];
    gameMap = new Map(name, new int[]{0, 4}, new int[]{gameBoard.length - 1, 4});
    towers = new ArrayList<Tower>();
    enemies = new ArrayList<Enemy>();
    health = hp;
    money = mulah;
  }
  
  public void waypoints() {
    addWaypoint(new int[]{3, 4});
    addWaypoint(new int[]{3, 10});
    addWaypoint(new int[]{11, 10});
    addWaypoint(new int[]{11, 4});
  }
  
  // what updates the enemies positions; game will handle the drawing
  
  // Should run every frames(60 frames per second)
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
        nextX = currentX + 1;
      } else if (currentDirection.equals("down")) {
        nextY = currentY + 1;
      } else if (currentDirection.equals("up")) {
        nextY = currentY - 1;
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

  public boolean enemyMoveHelper(int futureX, int futureY) {
      int gridX = futureX / 60;
      int gridY = futureY / 60;
      if ((gridX < gameBoard.length && gridY < gameBoard[0].length) && gameBoard[gridX][gridY] == -1) {
        return true;
      }
      return false;
  }
  
  public void enemyAtEnd() {
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      int currentX = enemy.getX();
      if (currentX >= end[0]*61) {
        enemies.remove(i);
        if (enemy.getHealth() < 10000) {
          health--;
        }
        else if (enemy.getHealth() > 10000) {
          health -= 20;
        }
        i--; // Decrement i to account for the removed enemy
      }
    }
  }

  // will be called from mouseCLicked function, x and y will the mouseX, mouseY
  public void placeTower(int x, int y, int towerCost) {
    if (money >= towerCost) {
      useMoney(towerCost);
      towers.add(new Tower(1, 100, 100, 10, x, y)); // will change stats later
    }
  }
  
  // for special enemies
  public void spawnEnemy(boolean isBoss, int hp, int speed) {
    int spawnX = start[0]*60 + 30;
    int spawnY = start[1]*60 + 30;
    enemies.add(new Enemy(hp, speed, spawnX, spawnY, isBoss)); //placeholder values
  }
  
  // this method will be called for a normal wave in the game
  // int[] stats = HP, Speed, Delay, Amount of Enemies
  public void spawnWave(int[] stats) {
    int delay = stats[2];
    int amount = stats[3];
    int spawnX = start[0]*60 + 30;
    int spawnY = start[1]*60 + 30;
    int frameSpawned = frameCount;
    while (amount >= 1) {
      if (frameCount - frameSpawned >= delay) {
        frameSpawned = frameCount;
        enemies.add(new Enemy(stats[0], stats[1], spawnX, spawnY, isBoss);
      }     
    }
  }
  
  // debug, used to test tower attacks
  public void spawnEnemyDebug(int x, int y) {
    enemies.add(new Enemy(1, 10, x, y, false)); //placeholder values
  }
  
  
  public void loseHP() { // Eventually different enemies will cause different amount of health loss
    health--; 
  }
  
  public int[][] getBoard() {
    return gameBoard;
  }
 
  public int getMoney() {
    return money;
  }
  
  public void useMoney(int moneyUsed) {
    money = money - moneyUsed;
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
  
  public void attack() {
     for (int i = 0; i < enemies.size(); i++) {
       Enemy enemy = enemies.get(i);
       for (int j = 0; j < towers.size(); j++) {
          Tower tower1 = towers.get(j);
          if (enemy.loseHealth(tower1.getDamage(), tower1.getRange())) {
            fill(255, 0, 0);
            //change sprite
            PImage deadEnemy = loadImage("RedBalloonEnemyPopping.png");
            if (enemy.getHealth() < 10000) {
              image(deadEnemy, enemy.getX(), enemy.getY());
              text("POP!", enemy.getX(), enemy.getY() - 15);
            }
            //circle(enemy.getX(), enemy.getY(), 20);
          }
       }
     }
  }
  
  public void removeDeadEnemies() {
    for (int i = 0; i < enemies.size(); i++) {
       Enemy enemy = enemies.get(i);
       if (enemy.dropMoney() == 100) {
         money += 100;
         enemies.remove(i);
         i--; // Decrement i to account for the removed enemy
      }
    }
  } 
}
