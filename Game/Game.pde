Level gameLevel;
int towerAmount;
int prevTowerAmount;
int frameLastAttacked = 0;

void setup() {
  size(1080, 900);
  gameLevel = new Level("Test");
  towerAmount = 0;
  prevTowerAmount = 0;
  drawGrid();
}

void draw() {
  if (gameLevel.getHealth() >= 1) {
    background(255);
    drawGrid();
    drawEntities();
    textSize(25);
    tick();
    text(frameCount, 10, 30);
    drawMoneyHealth();
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

void spawnEnemyInWave() {
    
}

void tick() {
  float cooldown = 0;
  ArrayList<Tower> towers = gameLevel.getTowers();
  if (towers.size() > 0) {
     cooldown = towers.get(0).returncdt();
  }
  gameLevel.enemyMove();
  if (frameCount - frameLastAttacked >= cooldown) {
    gameLevel.attack();
    frameLastAttacked = frameCount;
  }
  gameLevel.removeDeadEnemies();
}

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
      else if (grid[i][j] == 1) {
        fill(0, 150, 255); 
      }
       square(i*60, j*60, 60);   
    }
  }
}

void drawMoneyHealth() {
   textSize(30);
   text("Health: " + gameLevel.getHealth(),10, 60); 
   text("Money: " + gameLevel.getMoney(),10, 90);
}

void drawEntities() {
  fill(0); 
  // if (prevTowerAmount != towerAmount) { 
    ArrayList<Tower> t = gameLevel.getTowers();
     for (int i = 0; i <  t.size(); i++) {
       Tower tower1 = t.get(i);
       tower1.displayTower();
    }
    prevTowerAmount++;
  // }
  ArrayList<Enemy> enemies = gameLevel.getEnemies(); //<>//
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy1 = enemies.get(i);
    enemy1.displayEnemy();
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    int[][] gameB = gameLevel.getBoard();
    if (!(gameB[mouseX/60][mouseY/60] == -1)) {
      gameLevel.placeTower(mouseX, mouseY, 250); 
      towerAmount++;
    }
  }
  else if (mouseButton == RIGHT) { //<>//
    gameLevel.spawnEnemyDebug(mouseX, mouseY);
  }
}

void keyPressed() {
  if (gameLevel.getHealth() <= 0 && key == ' ') {
     gameLevel = new Level("Level 1");
  }
  else if (key == ' ') {
      gameLevel.spawnEnemy(true, 1000000, 100);
  }
}
