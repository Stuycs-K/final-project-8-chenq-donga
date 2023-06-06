import java.util.ArrayDeque;

public class Waves {
   private int currentAmount;
   private int maxSize;
   private ArrayDeque<int[]> enemies;
   
   public Waves(int enemyCount) {
      currentAmount = 0;
      maxSize = enemyCount;
      enemyStats = new ArrayDeque<Enemies>();
      generateEnemies();
   }
   
   public int[] getNextEnemyInWave() {
      if (currentAmount > 0) {
        currentAmount--;
        return enemies.poll(); // gets first thing in ArrayDeque 
      }
   }
   
   public void generateEnemies() {
      while (currentAmount < maxSize) {
         int speed = (int)(Math.random() * 3);
         int hp = (int)(Math.random() * 2);
         enemies.add(new int[]{hp, speed});
      }  
   }
   
   public boolean waveFinished() {
      if (currentAmount == 0) {
         return true; 
      }
   }
}
