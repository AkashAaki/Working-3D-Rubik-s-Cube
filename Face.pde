class Face{
  PVector normal;
  color c;
  
  Face(PVector normal, color c){
    this.normal = normal;
    this.c = c;
  }
  
  void turnZ(float angle){
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.y * sin(angle));
    v2.y = round(normal.x * sin(angle) + normal.y * cos(angle));
    v2.z = normal.z;
    normal = v2;
  }
  
  void turnY(float angle){
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.z * sin(angle));
    v2.y = normal.y;
    v2.z = round(normal.x * sin(angle) + normal.z * cos(angle));
    normal = v2;
  }
  
  void turnX(float angle){
    PVector v2 = new PVector();
    v2.x = normal.x;
    v2.y = round(normal.y * cos(angle) - normal.z * sin(angle));
    v2.z = round(normal.y * sin(angle) + normal.z * cos(angle));
    normal = v2;
  }
  
  void show(){
    pushMatrix(); //https://www.youtube.com/watch?v=OaBSHuP4xcE
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(0.5*normal.x, 0.5*normal.y, 0.5*normal.z);
    //rotate(HALF_PI, normal.x, normal.y, normal.z);
    if(abs(normal.x)>0){
      rotateY(HALF_PI);
    } else if(abs(normal.y)>0){
      rotateX(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
}
