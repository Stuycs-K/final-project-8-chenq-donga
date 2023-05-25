void setup() {
  size(1080, 900);
  
}

void draw() {
  drawGrid();
}

void drawGrid() {
  // There will be a int[][] arr that is returned from level that the for loop will read 
  fill(0);
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      /* if you can place a tower, then the square should be light green
         if a square is on the path, then the square should be brownisn yellow
         otherwise if a square is occupied by an tower, it should be blue
      */
       square(i*20, j*20, 20);   
    }
  }
}
