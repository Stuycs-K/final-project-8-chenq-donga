public class Enemy {
  public float hp;
  public float speed;
  
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
