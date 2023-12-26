class Board{
  
  float cellSize;
  int H, W;
  int Y, X;
  Cell[][] cells;
  
  public Board(int w, int h, float size){
    cellSize = size;
    H = h;
    W = w;
    
    Y = parseInt(H/cellSize);
    X = parseInt(W/cellSize);
    
    cells = new Cell[Y][X];
  
  }
  
  void addCells(){
    boolean state = false;
    float prob;
    for(int y=0; y<Y; y++){
      for(int x=0; x<X; x++){
        prob = random(1);
        if(prob<0.012){
          state = true;
        }
        println(prob,state);
        cells[y][x] = new Cell(state, x, y, cellSize);
      }
    }  
  }
  
  void update(){
  
  }
  
  void show(){
    for(Cell[] cls: cells){
      for(Cell c: cls){
        c.show();
      }
    }
  }
  
}
