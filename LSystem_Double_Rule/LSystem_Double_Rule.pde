import java.util.Calendar;

LSystem lsys;
Turtle turtle;

// Double Rule Branching Structures SRBS
Boolean printer = true;
int rate = 1;

/*
String LName = "DRBS-D";
 int maxGen = 7;
 float LAngle = 20;
 String LRuleX = "F[+X]F[-X]+X";
 String LRuleF = "FF";
 float LLength = 50;
 float LLenVar = 0.675; 
 */

/*
String LName = "DRBS-E";
 int maxGen = 7;
 float LAngle = 25.7;
 String LRuleX = "F[+X][-X]FX";
 String LRuleF = "FF";
 float LLength = 50;
 float LLenVar = 0.675; 
 */

String LName = "DRBS-E-2";
int maxGen = 7;
float LAngle = 35.3;
String LRuleX = "F[+X]+F-[][-X]FX";
String LRuleF = "FF";
float LLength = 40;
float LLenVar = 0.675; 


/*
String LName = "DRBS-F";
 int maxGen = 5;
 float LAngle = 22.5;
 String LRuleX = "F-[[X]+X]+F[+FX]-X";
 String LRuleF = "FF";
 float LLength = 50;
 float LLenVar = 0.72; 
 */

int genCounter = 0;

// QUARTER_PI = 45°
// HALF_PI, PI/2 = 90°
// PI = 180°
// TWO_PI = 360°


void setup() {
  size(900, 900);
  frameRate(rate);

  // create the Rule Class with 1 Rule init
  Rule[] ruleset = new Rule[2];
  // define ruleset 1 & 2
  ruleset[0] = new Rule('X', LRuleX);
  ruleset[1] = new Rule('F', LRuleF);
  // create the LSystem, define the Axion and apply the ruleset
  lsys = new LSystem("X", ruleset);  
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
  if (printer && genCounter < (maxGen + 1)) {
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

void imprint() {
  text(LName, 10, height-85);
  text("Gen=" + genCounter, 10, height-70);
  text("Len=" + LLength + ", Mul=" + LLenVar + ", Ang=" + LAngle, 10, height-55);  
  text("X", 10, height-40);
  text("X" + " => " + LRuleX, 10, height-25);
  text("F" + " => " + LRuleF, 10, height-10);
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
