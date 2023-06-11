Level gameLevel;
int towerAmount;
int prevTowerAmount;
int frameLastAttacked = 0;
int frameLastSpawned = 0;
boolean hasWon = false;

void setup() {
  size(1080, 900);
  gameLevel = new Level("Test");
  towerAmount = 0;
  prevTowerAmount = 0;
  drawGrid();
}

void draw() {
  if (gameLevel.getCurrentWave() > 20) {
    background(255);
    hasWon = true;
    fill(0, 255, 0);
    textSize(100);
    text("YOU WIN!", 310, 450);
    fill(0);
    textSize(50);
    text("Press spacebar to restart", 270, 550);
  }
  else if (gameLevel.getHealth() >= 1) {
    background(255);
    drawGrid();
    drawEntities();
    textSize(25);
    tick();
    text(frameCount, 10, 30);
    drawMoneyHealthWave();
    drawHighlight();
  }
  else if (gameLevel.getHealth() <= 0) {
     background(255);
     fill(255, 0, 0); 
     textSize(100);
     text("GAME OVER", 270, 450);
     fill(0);
     textSize(50);
     text("Press spacebar to restart", 270, 550);
  }
}

boolean detectWaveEnd(int[] stats) {
   return (stats[0] == -1 && gameLevel.getEnemies().size() == 0);
}

boolean isEnemyInBuffer(int[] stats) {
  return (!(stats[0] == -1));
}

// TICK: WHAT ACTUALLY RUNS THE DAMAGE CALCULATIONS
void tick() {
  int spawnCD = 20;
  float attackCooldown = 0;
  ArrayList<Tower> towers = gameLevel.getTowers();
  if (towers.size() > 0) {
     attackCooldown = towers.get(0).returncdt();
  }
  if (frameCount - frameLastSpawned >= spawnCD) {
    int[] stats = gameLevel.getWaves().getNextEnemyInWave();
    if (isEnemyInBuffer(stats)) {
      frameLastSpawned = frameCount;
      spawnCD = stats[2];
      gameLevel.spawnEnemy(stats[0], stats[1]);
    }
    if (detectWaveEnd(stats)) {
      gameLevel.nextWave(); 
    }
  }
  gameLevel.enemyMove();
  if (frameCount - frameLastAttacked >= attackCooldown) {
    gameLevel.attack();
    frameLastAttacked = frameCount;
  }
  gameLevel.removeDeadEnemies();
}

// DRAWING FUNCTIONS
// CURRENTLY INCLUDES DRAWING THE GRID, AS WELL AS THE ENEMIES AND TOWERS AS WELL AS MONEY
void drawGrid() {
  int[][] grid = gameLevel.getBoard();
  fill(0);
  stroke(255);
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      /* if you can place a tower, then the square should be light green
         if a square is on the path, then the square should be brownisn yellow
         otherwise if a square is occupied by an tower, it should be blue
      */
      if (grid[i][j] == 0) {
        fill(0, 255, 127); 
      }
      else if (grid[i][j] == -1) {
        fill(190, 160, 130); 
      }
      else if (grid[i][j] >= 1) {
        fill(0, 150, 255); 
      }
       square(i*60, j*60, 60);   
    }
  }
}

void drawEntities() {
  fill(0); 
  // if (prevTowerAmount != towerAmount) { 
    ArrayList<Tower> t = gameLevel.getTowers();
     for (int i = 0; i <  t.size(); i++) { //<>//
       Tower tower1 = t.get(i);
       tower1.displayTower();
    }
    prevTowerAmount++;
  // } //<>// //<>// //<>//
  ArrayList<Enemy> enemies = gameLevel.getEnemies(); //<>//
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy1 = enemies.get(i);
    enemy1.displayEnemy();
  }
}

void drawMoneyHealthWave() {
   textSize(30);
   text("Health: " + gameLevel.getHealth(),10, 60);  //<>//
   text("Money: " + gameLevel.getMoney(),10, 90);
   text("Current Wave: " + gameLevel.getCurrentWave(), 10, 120);
}

void highlightTowerRange() {
  int[][] board = gameLevel.getBoard();
  if (board[mouseX/60][mouseY/60] >= 1) {
     drawHighlight(); 
  }
}

void drawHighlight() {
  println(gameLevel.getTowerIndex());
  int[][] board = gameLevel.getBoard();
  ArrayList<Tower> tower = gameLevel.getTowers();
  fill(255, 255, 255, 127); // 127 is the alpha channel
  int x = mouseX / 60;
  int y = mouseY / 60;
  if (board[x][y] >= 1) {
    Tower toHighlight = tower.get(board[x][y] - 1);
    println("board xy" + (board[x][y] - 1));
    int[][] range = toHighlight.getRange();
    int numRange = toHighlight.getNumRange();
    square(range[0][0], range[0][1], numRange * 2.3);
  }
}


// INPUT DETECTION, CURRETNLY ON MOUSELEFT CLICK AND KEY PRESSES
void mouseClicked() {
  if (mouseButton == LEFT) {
    if (mouseButton == LEFT) {
       int[][] gameB = gameLevel.getBoard();
       if (!(gameB[mouseX/60][mouseY/60] == -1)) {
      gameLevel.placeTower(mouseX, mouseY, 250, 1); 
      towerAmount++;
       }
    }
  }
}

void keyPressed() {
  if ((gameLevel.getHealth() <= 0 || hasWon)  && key == ' ') {
     hasWon = false;
     gameLevel = new Level("Level 1");
  }
  else if (key == ' ') {
      gameLevel.spawnEnemy(1000000, 100);
  }
  else if (key == 's') {
     gameLevel.setWave(); 
  }
}
