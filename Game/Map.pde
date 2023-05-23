import java.util.LinkedList;
public class Map {
  private String mapName;
  private LinkedList<int[]> pathNodes;
  
  public Map(String name) {
    mapName = name;
    mapTiles = new int[width/30][height/30];
  }
  
  public String getMapName() {
    return mapName;
  }
  
  public int[][] getMap() {
    return mapTiles; 
  }
  
  public void setStart(int[] cord) {
    pathNodes.addFirst(cord);
  }
  
  public void setEnd(int[] cord) {
    pathNodes.addLast(cord); 
  }
  
  public int[] nextLocation() {
    return pathNodes.removeFirst(); 
  }
}
