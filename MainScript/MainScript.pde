Shape[] shapes;
int size;
float speed;
float time;

float t1;
float maxSpeed;
float totalAngle;

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
  
  maxSpeed = PI/15;
  t1 = sqrt(PI - pow(maxSpeed, 2));
  totalAngle = 0;
  
  shapes[0] = new Shape(0, 0);
  shapes[1] = new Shape(1, PI/2);
  shapes[2] = new Shape(2, PI);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateY(PI/2);
  
  if(time < t1){
    speed = map(time, 0, t1, 0, maxSpeed); 
  } else if(time < 2*t1){
    speed = map(time, t1, 2*t1, maxSpeed, 0);    
  } else {
    println(totalAngle, PI/2);
    totalAngle = 0;
    time = 0;
  }
  
  for(Shape shape : shapes){
    shape.update(speed);
    shape.display();
  }
  
  time += 0.23746515;
  totalAngle += speed;
}
