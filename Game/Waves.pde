import java.util.ArrayDeque;

public class Waves {
   private int currentAmount;
   private int maxSize;
   private ArrayDeque<int[]> enemies;
   
   public Waves(int enemyCount) {
      currentAmount = 0;
      maxSize = enemyCount;
      enemies = new ArrayDeque<int[]>();
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
      while (currentAmount < maxSize) {
         int delay = 20 + (int)(Math.random() * 30);
         int speed = (int)(Math.random() * 3);
         int hp = 1 + (int)(Math.random() * 3);
         enemies.add(new int[]{hp, speed, delay});
         currentAmount++;
      }  
   }
   
   public boolean waveFinished() {
      if (currentAmount == 0) {
         return true; 
      }
      return false;
   }
}
