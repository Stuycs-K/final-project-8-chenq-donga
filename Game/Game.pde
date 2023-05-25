void setup() {
  size(1080, 900);
  
}

void draw() {

}

void drawGrid() {
  fill(0);
  for (int i = 0; i < width; i += 20) {
    for (int j = 0; j < height; j += 20) {
      /* if you can place a tower, then the square should be light green
         if a square is on the path, then the square should be brownisn yellow
         otherwise if a square is occupied by an tower, it should be blue
      */
       square(i, j, 20);   
    }
  }
}
