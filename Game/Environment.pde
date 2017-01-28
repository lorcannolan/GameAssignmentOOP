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
  
  void ground()
  {
    for (int row = 0 ; row < 1 ; row ++)
    {
      for (int col = 0 ; col < numCellWidth ; col ++)
      {
        float f = random(0, 1);
        if (f > 0.5f)
        {
          world[row][col] = true;
        }
      }
    }
  }
  
  void displayGround()
  {
    for (int row = 0 ; row < 1 ; row ++)
    {
      for (int col = 0 ; col < numCellWidth ; col ++)
      {
        int x = cellWidth * col;
        int y = cellHeight * row;
        if (world[row][col])
         {
           fill(0, 255, 0);         
         } 
         else
         {
           fill(0);         
         }
         rect(x, y, cellWidth, cellHeight);
      }
    }
  }
}