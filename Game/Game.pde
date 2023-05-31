Level gameLevel;

void setup() {
  size(1080, 900);
  gameLevel = new Level("Test");
  
}

void draw() {
  drawGrid();
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
