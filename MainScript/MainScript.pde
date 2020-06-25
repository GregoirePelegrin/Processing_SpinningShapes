// TODO: Modify the speed for it to not be linear

Shape[] shapes;
int size;
float speed;
float time;

void setup(){
  size(600, 600, P3D);
  frameRate(30);
  colorMode(HSB);
  rectMode(CENTER);
  noFill();
  
  shapes = new Shape[3];
  size = 250;
  speed = 0;
  time = 0;
  
  shapes[0] = new Shape(0, 0);
  shapes[1] = new Shape(1, PI/2);
  shapes[2] = new Shape(2, PI);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateY(PI/2);
  
  speed = PI/120;
  /*if(time > XX){
    time = 0;
  }*/
  
  for(Shape shape : shapes){
    shape.update(speed);
    shape.display();
  }
  
  time += 0.01;
}
