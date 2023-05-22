public class Map {
  public int[][] mapTiles;
  public String mapName;
  
  public Map(PImage img, String name) {
    mapName = name;
    mapTiles = new int[width/30][height/30];
  }
}
