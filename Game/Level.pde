public class Level {
  private int[][] gameBoard;
  private Map gameMap;
  private int health; // drops when enemies cross the end
  private int money; // amount of money that the player has
  private ArrayList<Tower> towers;
  private ArrayList<Enemy> enemies;
  private int[] start;
  
  
  private final int towerSquare = 0;
  private final int occupiedTowerSquare = 1;
  private final int occupiedPathSquare = -2; // for when enemies are on the path
  private final int path = -1;
  
  
  public Level(String name) { // normal constructor used in normal games
    gameBoard = new int[width/60][height/60];
    gameMap = new Map(name, new int[]{0, 4}, new int[]{gameBoard.length - 1, 4});
    start = gameMap.getStart();
    waypoints();
    setPath();
    towers = new ArrayList<Tower>();
    enemies = new ArrayList<Enemy>();
    health = 20;
    money = 500;
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
  
  // will be called from mouseCLicked function, x and y will the mouseX, mouseY
  public void placeTower(int x, int y) {
    towers.add(new Tower(1, 1, 5, 10, x, y)); // will change stats later
  }
  
  // will spawn enemy on start, has cooldown time
  public void spawnEnemy() {
    enemies.add(new Enemy(10, 10, 0, 0)); //placeholder values
  }
  
  
  public void loseHP() { // Eventually different enemies will cause different amount of health loss
    int[] end = gameMap.getEnd();
    if (isEnemyOnSquare(end)) {
      health--; 
    }
  }
  
  public int[][] getBoard() {
    return gameBoard;
  }
  
  private boolean isEnemyOnSquare(int[] cord) {
    if (gameBoard[cord[0]][cord[1]] == -2) {
      return true; 
    }
    else {
      return false;
    }
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
              gameBoard[i][j] = -1;
            }
          } else {
            for (int j = currentY; j >= nextLocation[1]; j--) {
              gameBoard[i][j] = -1;
            }
          }
        currentX = nextLocation[0];
        currentY = nextLocation[1];
       }
    }
  }
}