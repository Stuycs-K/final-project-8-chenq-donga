public class Waves {
  private int WavesTracker = 0;
  
  public void StartWaves() {
    if (WavesTracker == 0) {
      enemy.spawnEnemy(1, 1);
  }
}
