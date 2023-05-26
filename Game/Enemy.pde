public class Enemy {
  public float hp;
  public float speed;
  public int xcoord;
  public int ycoord;
  
  public Enemy(int hachepee, int speede, int x, int y) {
    hp = hachepee;
    speed = speede;
    xcoord = x;
    ycoord = y;
  }
  
  public void losehealth(float damage) {
    if (!death()) {
    hp -= damage;
    }
  }
  
  public boolean death() {
    if (hp <= 0) { 
      return true;
    }
    return false;
  }
  
  public float getspeed() {
    return speed;
  }
    
  public int getX() {
    return xcoord; 
  }
  
  public int getY() {
    return ycoord; 
  }
  
  public void move(int xOffset, int yOffset) {
    xcoord += xOffset;
    ycoord += yOffset;
  }
}
