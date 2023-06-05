public class Waves {
   private int currentWave;
   private int waveCount;
   private ArrayList<int[]> enemyStats;
   
   public Waves(int count) {
      waveCount = count;    
      currentWave = 0;
      enemyStats = new ArrayList<int[]>();
      generateEnemies();
   }
   
   public int[] getWave() {
      int prevWave = currentWave;
      currentWave++;
      return enemyStats.get(prevWave);
   }
   
   // Currently random generation, will add more
   public void generateEnemiesWave() {
     for (int i = 0; i < enemyStats.size(); i++) {
        int enemyAmount = 5 + (int)(Math.random() * (currentWave + (waveCount / 2)));
        int speed = (int)(Math.random() * 3);
        int hp = (int)(Math.random() * 2);
        int delay = 20 + (int)(Math.random() * 30); // based on frame count
        enemyStats.set(i, new int[]{hp, speed, delay, enemyAmount});
     }
   }
  
   public int getWaveNumber() {
     return currentWave + 1;
   }
}
