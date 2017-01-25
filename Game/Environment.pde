class Environment
{
  // 2d boolean array containg the location of cells
  boolean[][] world;
  // amount of cells in the width & height directions
  int numCellWidth, numCellHeight;
  // size of cells
  int cellWidth, cellHeight;
  
  Environment(int cellWidth, int cellHeight)
  {
    this.cellWidth = cellWidth;
    this.cellHeight = cellHeight;
    numCellWidth = width / cellWidth;
    numCellHeight = height / cellHeight;
    world = new boolean[numCellWidth][numCellHeight];
  }
}