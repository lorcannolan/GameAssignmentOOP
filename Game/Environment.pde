class Environment
{
  // 2d boolean array containg the location of cells
  boolean[][] world;
  // how big the world is in width & height as world is bigger than canvas size
  int worldWidth, worldHeight;
  // amount of cells in the width & height directions
  int numCellWidth, numCellHeight;
  // size of cells
  int cellWidth, cellHeight;
  
  Environment(int worldWidth, int worldHeight, int cellWidth, int cellHeight)
  {
    this.worldWidth = worldWidth;
    this.worldHeight = worldHeight;
    this.cellWidth = cellWidth;
    this.cellHeight = cellHeight;
    numCellWidth = worldWidth / cellWidth;
    numCellHeight = worldHeight / cellHeight;
    world = new boolean[numCellWidth][numCellHeight];
  }
}