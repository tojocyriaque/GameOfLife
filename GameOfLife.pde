Board brd;
float cellSize = 10;

void setup(){
  size(800,600);
  brd = new Board(width,height,cellSize);  
  brd.addCells();
}

void draw(){
  background(0);
  brd.show();
}
