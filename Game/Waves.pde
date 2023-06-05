public class Waves {
   private int currentWave;
   private int waveCount;
   private ArrayList<int[2]> enemyStats;
   
   public Waves(int count) {
      waveCount = count;    
      currentWave = 0;
      enemyStats = new ArrayList<int[2]>;
      generateEnemies();
   }
   
   public Enemy[] getWave() {
      int prevWave = currentWave;
      currentWave++;
      return enemyStats.get(prevWave);
   }
   
   // Currently random generation, will add more
   public void generateEnemies() {
     for (int i = 0; i < enemyStats.size(); i++;) {
        int speed = (int)(Math.random() * 3);
        int hp = (int)(Math.random() * 2);
        enemyStats.set(i, new int[]{hp, speed};
     }
   }
  
   public int getWave() {
     return currentWave + 1;
   }
}
