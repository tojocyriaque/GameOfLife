Board Brd;
float cellSize = 2;
color cellColor = #009090;
int interval = 5;
boolean run = false;
boolean random = true;//generate random cells

void setup(){
  size(600,600);
  Brd = new Board(width, height, cellSize, cellColor);
  if(random){
    Brd.addRandomCells();
  }
  else{
    Brd.addCells();
  }
}

void keyPressed(){
  switch(key){
    case 'r':
      run = false;
      if(random){
        Brd.addRandomCells();
      }else{
        Brd.addCells();
      }
      break;
      
    case ' ':
      run = !run;
      break;
  }
}

void mousePressed(){
  int mx = parseInt(mouseX/cellSize);
  int my = parseInt(mouseY/cellSize);
  
  Brd.cells[my][mx] = new Cell(!Brd.cells[my][mx].alive,cellSize);
  Brd.buffer[my][mx] = new Cell(!Brd.buffer[my][mx].alive,cellSize);
}

void draw(){
  background(10,10,10);
  Brd.show();
  if(frameCount%interval==0 && run){
    Brd.update();
  }
}
