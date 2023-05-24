public class Level {
  private int[][] gameBoard;
  private Map gameMap;
  private final int towerSquare = 0;
  private final int occupiedTowerSquare = 1;
  private final int path = -1;
  
  
  public Level(String name) {
    gameBoard = new int[width/20][height/20];
    gameMap = new Map(name, new int[]{0, 4}, new int[]{gameBoard.length - 7, 4};
  }
  
  public void
}
