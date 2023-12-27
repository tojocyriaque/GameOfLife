class Board{
  
  int h,
      w;
  float cellSize;
  color cellColor;
      
  Cell[][] cells;
  Cell[][] buffer;
  
  public Board(int w, int h, float cs, color col){
    this.h = h;
    this.w = w;
    
    cellSize = cs;
    cellColor = col;
    
    cells = new Cell[h][w];
    buffer = new Cell[h][w];
  }
  
  void addCells(){
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        cells[i][j] = new Cell(false,cellSize);
        buffer[i][j] = new Cell(false,cellSize);
      }
    }
  }
  
  void addRandomCells(){
    float p;
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        p = random(1);
        if(p<0.125){
          cells[i][j] = new Cell(true,cellSize);
          buffer[i][j] = new Cell(true,cellSize);
        }
        else{
          cells[i][j] = new Cell(false,cellSize);
          buffer[i][j] = new Cell(false,cellSize);
        }
      }
    }
  }
  
  int neighboursCount(int x, int y){
    int c = 0;
    for(int i=y-1; i<=y+1; i++){
      for(int j=x-1; j<=x+1; j++){
        if(j!=x || i!=y){
          
          if(0<=j && j<w && 0<=i && i<h){
            if(buffer[i][j].alive){
              c = c + 1;
            }
          }
          
        }
      }
    }
    return c;
  }
  
  void update(){
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        boolean cellAlive = cells[i][j].alive;
        int n = neighboursCount(j,i);
        
        if(n==0){
          cells[i][j].die();
        }
        else if(cellAlive){
          if(n<2 || n>3){
            cells[i][j].die();
          }
        }
        else{
          if(n==3){
            cells[i][j].respawn();
          }
        }
        
      }
    }
    
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        buffer[i][j] = new Cell(cells[i][j].alive, cellSize);
      }
    }
    
  }
  
  void show(){
    for(int y=0; y<h; y++){
      for(int x=0; x<w; x++){
        cells[y][x].show(x, y, cellColor);
      }
    }
  }
  
}
