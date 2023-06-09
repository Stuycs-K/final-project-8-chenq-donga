public class Enemy {
  private float hp;
  private float speed;
  private int xcoord;
  private int ycoord;
  private String direction;
  PImage EnemySprite;
  //make a money variable
  //idk where money should be kept, but probably in game.
  //will make a money variable in enemy for now
  //public int money;
  
  // PImage EnemySprite = loadImage("RedEnemyBalloon1.png");
  // PImage BossMonsterSprite = loadImage("BossMonsterOne.png");
  
  //needs a money drop amount
  public int dropMoney() {
    if (isDead()) {
      return 25;
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
    return 0;
  }
  
  public Enemy(int hachepee, int speede, int x, int y, boolean isBoss) {
    hp = hachepee;
    speed = speede;
    xcoord = x;
    ycoord = y;
    direction = "right";
    if (isBoss) {
      EnemySprite = loadImage("BossMonsterOne.png");
    }
    
    ////wave 5
    else if (hp >= 20 && hp < 40) {
      EnemySprite = loadImage("Wave5Blimp.png");
    }
    ////wave 10
    else if (hp >= 40 && hp < 60) {
      EnemySprite = loadImage("Wave10HAB.png");
    }
    ////wave 15
    else if (hp >= 60 && hp < 90) {
      EnemySprite = loadImage("Wave15HAB.png");
    }
    ////wave 20
    else if (hp >= 90 && hp < 1000) { 
      EnemySprite = loadImage("Wave20Killer.png");
    }
    
    else {
      EnemySprite = loadImage("RedBalloonEnemyTesting.png");
    }
  }
  
  public boolean inRange(int[][] range) {
    if (xcoord > range[0][0] && xcoord < range[1][0] && ycoord > range[0][1] && ycoord < range[2][1]) {
      return true; 
    }
    return false;
  }
  
  public boolean loseHealth(float damage, int[][] range) {
    if (inRange(range)) {
      hp = hp - damage;
      return true;
    }
    return false;
  }
  
  public boolean isDead() {
    if (hp <= 0) { 
      return true;
    }
    return false;
  }
  
  public float getspeed() {
    return speed;
  }
  
  public float getHealth() {
    return hp;
  }
    
  public int getX() {
    return xcoord; 
  }
  
  public int getY() {
    return ycoord; 
  }
  
  public void move() {
    if (direction.equals("up")) {
       ycoord = ycoord - (int)speed; 
    }
    else if (direction.equals("down")) {
       ycoord = ycoord + (int)speed; 
    }
    else if (direction.equals("right")) {
       xcoord = xcoord + (int)speed; 
    }
  }
  
  public void setDirection(String direc) {
     direction = direc; 
  }
  
  public String getDirection() {
     return direction; 
  }
   
  public void displayEnemy() {
    image(EnemySprite, xcoord, ycoord);
    textSize(15);
    text("Health : ", getX() - 30, getY() + 45);
    text(getHealth(), getX() + 15, getY() + 45);
  }
}
