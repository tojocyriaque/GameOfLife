class Cell{
  int x, y;
  float size;
  boolean alive;
  
  public Cell(boolean state, int x, int y, float size){ 
    alive = state;
    this.size = size;
    this.x = x;
    this.y = y;
  }
  
  void die(){
    alive = false;
  }
  
  void respawn(){
    alive = true;
  }
  
  void show(){
    if(alive){
      fill(80,160,80);
      rect(x,y,size,size);
    }  
  }
  
}
