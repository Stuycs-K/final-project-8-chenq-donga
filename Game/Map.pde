import java.util.LinkedList;
public class Map {
  private String mapName;
  private LinkedList<int[]> pathNodes;
  
  public Map(String name, int[] start, int[] end) {
    mapName = name;
    pathNodes = new LinkedList<int[]>();
    pathNodes.addFirst(start);
    pathNodes.addLast(end);
  }
  
  // map may have name
  public String getMapName() {
    return mapName;
  }
  
  public int[] getStart() { // sets the start o
    return pathNodes.removeFirst();
  }
  
  // get end, does not get removed until it's the final thing
  public int[] getEnd() { // set the end
    return pathNodes.get(pathNodes.size() - 1);
  }
  
  // Will always add to the index right before the last
  public void addWaypoint(int[] cord) {
    if (pathNodes.size() == 2) {
      pathNodes.add(1, cord); 
    }
    else {
      pathNodes.add(pathNodes.size() - 1, cord); 
    }
  }
  
  // returns the next location AND removes it from the linkList
  public int[] nextLocation() { 
    return pathNodes.removeFirst(); 
  }
  
  // returns size of the PathNodes linkList
  public int getSize() {
    return pathNodes.size(); 
  }
}
