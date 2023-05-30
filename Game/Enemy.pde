public class Enemy {
  public float hp;
  public float speed;
  //make a money variable
  //idk where money should be kept, but probably in game.
  //will make a money variable in enemy for now
  //public int money;
  
  //needs a money drop amount
  public int dropMoney(float death) {
    if (death) {
      return 1;
      //drop a certain amount of money based on the type of enemy
      //will probably have inherited enemies. 
      //we can make this money scaled to the enemy's health, or just a set amount everytime.
      //either one works, but if its scaled then player
      //might make too much money
      //im in favor for just a set amount
      //low health enemies, like the enemies that spawn at the start
      //drops 1 coin/money
      //higher enemies, 3 coins/money
      //then 5, then 10 for bosses
      //i think that'd be fair.
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
