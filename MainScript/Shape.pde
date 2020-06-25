class Shape{
  int type;
  
  float angle;
  float alpha;
  float weight;
  
  Shape(int t, float initAngle){
    this.type = t;
    this.angle = initAngle;
  }
  
  void update(float diffAngle){
    if(this.angle > 3*PI/2){
      this.angle = 0;
    }
    this.angle += diffAngle;
    this.weight = 5*sin(map(this.angle, 0, PI, PI/3, 2*PI/3));
    if(this.angle < PI/2){
      this.alpha = 255*sin(this.angle);
    } else if(this.angle<PI){
      this.alpha = 255*sin(map(this.angle, PI/2, PI, PI/2, 0));
    }
  }
  
  void display(){
    if(this.angle < PI){
      strokeWeight(this.weight);
      rotateY(this.angle);
      if(this.type == 0){
        // Blue circle
        stroke(127, 255, 255, this.alpha);
        translate(0, 0, 100);
        ellipse(0, 0, size, size);
        translate(0, 0, -100);
        ellipse(0, 0, size, size);
        translate(0, 0, -100);
        ellipse(0, 0, size, size);
        translate(0, 0, 100);
      } else if(this.type == 1){
        // Red square
        stroke(0, 255, 255, this.alpha);
        translate(0, 0, 100);
        rect(0, 0, size, size);
        translate(0, 0, -100);
        rect(0, 0, size, size);
        translate(0, 0, -100);
        rect(0, 0, size, size);
        translate(0, 0, 100);
      } else {
        // Green triangle
        stroke(63, 255, 255, this.alpha);
        translate(0, 0, 100);
        triangle(-size/2, -size/2, size/2, -size/2, 0, size/2);
        translate(0, 0, -100);
        triangle(-size/2, -size/2, size/2, -size/2, 0, size/2);
        translate(0, 0, -100);
        triangle(-size/2, -size/2, size/2, -size/2, 0, size/2);
        translate(0, 0, 100);
      }
      rotateY(-this.angle);
    }
  }
}
