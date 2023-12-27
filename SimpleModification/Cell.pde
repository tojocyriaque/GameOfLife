class Cell{
  boolean alive;
  float size;

  public Cell(boolean state, float size){
    alive = state;
    this.size = size;
  } 
  
  void die(){
    if(alive){
      alive = false;
    }
  }
  
  void respawn(){
    if(!alive){
      alive = true;
    }
  }
  
  void show(int x, int y, color col){
    if(alive){
      fill(col);
      rect(x*size, y*size, size, size);
    }
  }
  
}
