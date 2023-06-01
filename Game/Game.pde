Level gameLevel;

void setup() {
  size(1080, 900);
  gameLevel = new Level("Test");
  
}

void draw() {
  gameLevel.enemyMove();
  drawGrid();
  drawEntities();
  text("Nice", 0, 0);
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

void drawEntities() {
  ArrayList<Tower> t = gameLevel.getTowers();
  for (int i = 0; i <  t.size(); i++) {
     Tower tower1 = t.get(i);
     tower1.displayTower();
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    gameLevel.placeTower(mouseX, mouseY); 
  }
  else if (mouseButton == RIGHT) {
    gameLevel.spawnEnemyDebug(mouseX, mouseY);
  }
}
