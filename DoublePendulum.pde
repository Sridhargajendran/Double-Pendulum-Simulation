float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 50;
float a1 = PI/2;
float a2 = PI/4;
float aV1 = 0;
float aV2 = 0;
//float aA1 = 0;
//float aA2 = 0;
float g = 1;
PGraphics canvas;
float px2 = -1;
float py2 = -1;

void setup(){
  size(900, 600);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  
}

void draw(){
  //background(255);
  image(canvas, 0, 0);
  
  stroke(0);
  strokeWeight(2);
  translate(width/2, 50);
 
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  float num1 = -g * (2*m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1 - 2 * a2);
  float num3 = -2 * sin(a1 - a2) * m2;
  float num4 = aV2 * aV2 * r2 + aV1 * aV1 * r1 * cos(a1 - a2);
  float den = r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float aA1 = (num1 + num2 + num3 * num4) /den;
  
  num1 = 2 * sin(a1 - a2);
  num2 = aV1 * aV1 * r1 * (m1 + m2);
  num3 = g * (m1 + m2) * cos(a1);
  num4 = aV2 * aV2 * r2 * m2 * cos(a1 - a2);
  den = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float aA2 = (num1 * (num2 + num3 + num4)) / den;
  
  ellipse(0, 0, 6, 6);
  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);
  
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);
  
  aV1 += aA1;
  a1 += aV1;
  
  aV2 += aA2;
  a2 += aV2;
  
  canvas.beginDraw();
  //canvas.background(255);
  canvas.translate(width/2, 50);
  canvas.strokeWeight(1);
  canvas.stroke(0);
  if(frameCount > 1){
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();
  
  px2 = x2;
  py2 = y2;
}
