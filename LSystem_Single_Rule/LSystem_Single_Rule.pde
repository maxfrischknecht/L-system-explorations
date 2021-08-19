import java.util.Calendar;

LSystem lsys;
Turtle turtle;

// Single Rule Branching Structures SRBS
Boolean printer = true;

/*
String LName = "SRBS-A";
int maxGen = 5;
float LAngle = 25.7;
String LRule = "F[+F]F[-F]F";
*/

/*
String LName = "SRBS-B";
int maxGen = 5;
float LAngle = 25.7;
String LRule = "F[+F]F[-F][F]";
*/

/*
String LName = "SRBS-B-2";
int maxGen = 5;
float LAngle = 20;
String LRule = "F[+F]F[-F][F]";
*/

/*
String LName = "SRBS-C";
int maxGen = 4;
float LAngle = 22.5;
String LRule = "FF-[-F+F+F]+[+F-F-F]";
*/


String LName = "SRBS-D";
int maxGen = 4;
float LAngle = 35;
String LRule = "F[+FF][-FF]F[-F][+F]F";



char LStart = 'F';
String LStart2 = "F";

float LLength = 10; 
float LLenVar = 1; 
int genCounter = 0;

// QUARTER_PI = 45°
// HALF_PI, PI/2 = 90°
// PI = 180°
// TWO_PI = 360°


void setup() {
  size(900, 900);
  if(printer) { 
    frameRate(1);  
  }

  // create the Rule Class with 1 Rule init
  Rule[] ruleset = new Rule[1];
  // define ruleset 1
  ruleset[0] = new Rule(LStart, LRule);
  // create the LSystem, define the Axion and apply the ruleset
  lsys = new LSystem(LStart2, ruleset);  
  // create the turle (drawing)
  turtle = new Turtle(lsys.getSentence(), LLength, radians(LAngle));

  // println("start", "F-F-F-F");

  smooth();
}

void draw() {
  background(255);  
  fill(0);

  imprint();

  translate(width/2, height);
  // rotate everything 90° to draw from bottom up
  rotate(-PI/2);
  turtle.render();
  
  Ldraw();

  
  // export each image
  if(printer && genCounter < (maxGen + 1)){
    saveImg();
  }
  //noLoop();
}

void Ldraw() {
  if (genCounter < maxGen) {
    pushMatrix();
    lsys.generate();
    //println(lsys.getSentence());
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(LLenVar);
    popMatrix();
    redraw();
    genCounter++;
  }
}

void imprint(){
  text(LName, 10, height-70);
  text("Gen=" + genCounter, 10, height-55);
  text("Len=" + LLength + ", Mul=" + LLenVar + ", Ang=" + LAngle, 10, height-40);  
  text(LStart, 10, height-25);
  text(LStart + " => " + LRule, 10, height-10);
}

void saveImg() {
    saveFrame(LName + "_" + genCounter);
}

void mousePressed() {
  Ldraw();
}

void keyReleased() {
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
