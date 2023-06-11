import java.util.ArrayDeque;

public class Waves {
   private int currentAmount;
   private int maxSize;
   private ArrayDeque<int[]> enemies;
   private int waveNum;
   private int bossSpawned;
   
   public Waves(int enemyCount, int currentWave) {
      if (currentWave % 5 == 0) {
         enemyCount++; 
      }
      currentAmount = 0;
      bossSpawned = 0;
      maxSize = enemyCount;
      enemies = new ArrayDeque<int[]>();
      waveNum = currentWave;
      generateEnemies();
   }
   
   public int[] getNextEnemyInWave() {
      if (currentAmount > 0) {
        currentAmount--;
        return enemies.poll(); // gets first thing in ArrayDeque 
      }
      return new int[]{-1};
   }
   
   public void generateEnemies() {
     if (waveNum % 5 == 0) {
        int delay = 20 + (int)(Math.random() * 60);
        int speed = 1;
        int hp = (waveNum * 5) + healthScaling();
        enemies.add(new int[]{hp, speed, delay});
        currentAmount++;
     }
     else {
      while (currentAmount < maxSize) {
         int delay = 20 + (int)(Math.random() * 60);
         int speed = 1 + (int)(Math.random() * 2);
         int hp = 1 + (int)(Math.random() * 3) + healthScaling();
         if (spawnBoss()) {
           hp = 999999999; 
         }
         enemies.add(new int[]{hp, speed, delay});
         currentAmount++;
      }  
     }
   }
   
   public boolean waveFinished() {
      if (currentAmount == 0) {
         return true; 
      }
      return false;
   }
   
   public int healthScaling() {
      if (waveNum <= 10) {
         return (int)(Math.random() * (waveNum / 3)); 
      }
      else if (waveNum >= 10) {
        return (int)(Math.random() * (waveNum / 2)); 
      }
      return 0;
   }
   
   public boolean spawnBoss() {
     if (waveNum >= 20 && bossSpawned == 0) {
       float chance = waveNum * 0.01;
       println(chance);
       if (Math.random() > chance) {
         bossSpawned = 1;
         return true; 
       }
     }
     return false;
   }
   
}
