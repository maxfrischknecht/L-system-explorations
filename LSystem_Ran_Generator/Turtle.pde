// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Turtle {

  String todo;
  float len;
  float theta;

  Turtle(String s, float l, float t) {
    // the sentence
    todo = s;
    // the length of the line
    len = l; 
    // the rotation
    theta = t;
  } 

  void render() {
    stroke(0);
    strokeWeight(2);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F') {
        //ellipse(10, 10, 5, 15);
        line(0,0,len,0);
        //line(10, 10, len/2, 0);
        translate(len,0);
      } 
      else if (c == '+') {
        rotate(theta);
      } 
      else if (c == '-') {
        rotate(-theta);
      } 
      else if (c == '[') {
        pushMatrix();
      } 
      else if (c == ']') {
        popMatrix();
      }
    } 
  }

  void setLen(float l) {
    len = l; 
  } 

  void changeLen(float percent) {
    len *= percent; 
  }

  void setToDo(String s) {
    todo = s; 
  }

}
