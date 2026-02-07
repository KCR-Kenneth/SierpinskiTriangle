void setup() {
  size(1500,1000,P3D);
  fill(100);
  strokeWeight(1);
}

void draw() {
  background(256);
  // 3D Manuever
  translate(750,500,0);
  int y;
  if (mouseY > 300) {
    y = mouseY;
  } else {
    y = 300;
  }
  rotateX(-(y-500)*PI*1/1500);
  rotateY((mouseX-750)*PI*1/500);
  noStroke();
 
  cubing(810,0,0,0);
}

void cubing(int len, float x, float y, float z) {
  if (len <= 10) {
    pushMatrix();
      translate(x, y, z);
      stroke(200,200,200);
      box(len);
    popMatrix();
  } else {
    for (float i = y - (len/3); i <= y + (len/3); i+= len/3) {
      for (float j = x - (len/3); j <= x + (len/3); j+= len/3) {
        if ( i!=y || j!=x) {
          cubing(len/3, j, i, z - (len/3));
          cubing(len/3, j, i, z + (len/3));
        }
      }
    }
    cubing(len/3, x - (len/3), y - (len/3), z);
    cubing(len/3, x + (len/3), y - (len/3), z);
    cubing(len/3, x - (len/3), y + (len/3), z);
    cubing(len/3, x + (len/3), y + (len/3), z);
  }
}
