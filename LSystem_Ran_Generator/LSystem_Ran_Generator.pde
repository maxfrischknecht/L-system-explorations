import java.util.Calendar;

LSystem lsys;
Turtle turtle;
int genCounter = 0;


// Tripple Rule Branching Structures SRBS
Boolean printer = false;

String LName = "Complex-RBS-A";
int maxGen = 7;
float LAngle = 20;
String LRuleF;
String LRuleX;
String LRuleY;
float LLength = 10;
float LLenVar = 0.85; 

String ranChar; 

void setup() {
  size(900, 900);
  if (printer) {
    frameRate(1);
  }

  LCreate();
  LSet();
  smooth();
}


void draw() {
  background(255);  
  fill(0);

  text(LRuleX, 10, height-10);
  
  // imprint();
  translate(width/2, height);
  rotate(-PI/2);
  turtle.render();
  Ldraw();

  // export each image
  if (printer && genCounter < (maxGen + 1)) {
    saveImg();
  }
}

void LCreate() {
  //LRuleF = "F[+F]F[-F][F]";
  // LRuleF = "F[+F]"+ranChar()+"[-F]"+ranChar()+"";
  
  // LRuleF = "F["+ranDir()+"F]F["+ranDir()+"F]["+ranDir()+"F"+ranDir()+"]";
  // LRuleF = "F["+ranDir()+"F]F["+ranDir()+"F][F]";
  
   LRuleF = "FF";
   // LRuleX = "F["+ranDir()+"X]"+ranChar()+"["+ranDir()+"X]+X";
   LRuleX = "F[+"+ranChar()+"][-"+ranChar()+"]FX";
}

void LSet() {
  Rule[] ruleset = new Rule[2];
  ruleset[0] = new Rule('F', LRuleF);
  ruleset[1] = new Rule('X', LRuleX);
  //ruleset[2] = new Rule('Y', LRuleY);
  lsys = new LSystem("X", ruleset);  
  turtle = new Turtle(lsys.getSentence(), LLength, radians(LAngle));
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

String ranDir() {
  String[] CharArr = {"+", "-", "++", "--"};
  int i = int(random(4));
  String selection = CharArr[i];
  return selection;
}

String ranChar() {
  // String[] CharArr = {"X", "Y", "F", "+", "-"};
  String[] CharArr = {"FFX", "XXF", "FX", "XF"};
  int i = int(random(4));
  String selection = CharArr[i];
  // println(selection);
  return selection;
}

void imprint() {
  text(LName, 10, height-100);
  text("Gen=" + genCounter, 10, height-85);
  text("Len=" + LLength + ", Mul=" + LLenVar + ", Ang=" + LAngle, 10, height-70);  
  text("VZFFF", 10, height-55);
  //text("F" + " => " + LRuleF, 10, height-40);
  text("X" + " => " + LRuleX, 10, height-25);
  text("Y" + " => " + LRuleY, 10, height-10);
}

void saveImg() {
  saveFrame(LName + "_" + genCounter);
}

void mousePressed() {
  clear();
  genCounter = 0;
  LCreate();
  LSet();


  // Ldraw();
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
