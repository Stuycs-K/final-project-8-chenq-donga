public class Enemy {
  public float hp;
  public float speed;
  
  //needs a money drop amount
  public void dropMoney(float death) {
    if (death) {
      //drop a certain amount of money based on the type of enemy
      //will probably have inherited enemies. 
    }
  }
  
  public Enemy(int hachepee, int speede) {
    hp = hachepee;
    speed = speede;
  }
  
  public void losehealth(float damage) {
    if (!death) {
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
    
}
