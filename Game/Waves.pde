import java.util.ArrayDeque;

public class Waves {
   private int currentAmount;
   private int maxSize;
   private ArrayDeque<Enemies> enemies;
   
   public Waves(int enemyCount) {
      currentAmount = 0;
      maxSize = enemyCount;
      enemyStats = new ArrayDeque<Enemies>();
      generateEnemies();
   }
   
   public Enemy getNextEnemyInWave() {
      if (currentAMount > 0) {
        return enemies.poll(); // gets first thing in ArrayDeque 
      }
   }
   
   public void generateEnemies() {
      while (currentAmount < maxSize) {
          
      }  
   }
}
