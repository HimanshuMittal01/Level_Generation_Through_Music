import controlP5.*;

String BUILD_VERSION = "0.1.4";

String mode;

int numButtons;
float startPos;
float endPos;
int buttonWidth;
int buttonHeight;
boolean gradientEnable;
Button[] buttons;
boolean hoverOn;

public static final String game1 = "SampleGame1";
public static final String game2 = "SampleGame2";

public static String filePath;
public Settings settings;
Play play;

public ControlP5 cp5;
PFont fontHeading;
PImage img;

void setup() {
  fullScreen();
  //size(800 ,600);
  
  //ControlP5 for settings page
  cp5 = new ControlP5(this);
  
  //Initialising all the variables
  mode = "MainMenu";
  numButtons = 4;
  buttonWidth = 250;
  buttonHeight = 70;
  gradientEnable = true;
  startPos = 0.3f*height;
  endPos = 0.95f*height;
  hoverOn = false;
  
  //Text for buttons
  //Hardcoded strings
  //Change it when you change numButtons
  String[] texts = {"Input file", "Play", "Options", "Quit"};
  
  //Variables related to position of buttons
  float[] yPositions = new float[numButtons];
  for(int i=0; i<yPositions.length; i++) {
    yPositions[i] = (startPos + ((endPos - startPos)*i/numButtons))/height;
  }
  float xOffsetPer = 0.1f;
  
  //Finishong up with backend code for mainmenu
  //Additional settings
  settings = new Settings();
  play = new Play();
  surface.setResizable(true);
  
  //Creating button objects
  buttons = new Button[numButtons];
  for (int i=0; i<buttons.length; i++) {
    buttons[i] = new Button(texts[i], xOffsetPer, yPositions[i], buttonWidth, buttonHeight, gradientEnable);
  }
  
  settings.buttons.add(buttons[0]);
  settings.buttons.add(buttons[1]);
  settings.buttons.add(buttons[2]);
  settings.buttons.add(buttons[3]);
  settings.buttons.add(play.sg1Button);
  settings.buttons.add(play.sg2Button);
  settings.buttons.add(play.backButton);
  fontHeading = loadFont("SegoePrint-48.vlw");
  img = loadImage("data/MuMe artwork1.png");
  img.resize(width, height);
}

void draw() {
  switch(mode) {
    case "MainMenu":
      background(img);
      
      //Top 25% of the screen width is for Application Name (Witness Harmony)
      textFont(fontHeading, 100);
      text("Witness Harmony", 600, 100);
     
      //Buttons code
      for (Button b: buttons) {
        b.show();
      }
      
      //filePath
      textSize(24);
      text("Current file: "+filePath, width/2, height*0.35);
      
      //Build vesion
      text("Build Version: "+BUILD_VERSION, int (width*0.82), int (height*0.96));
      
      //Animations/Hover Effect
      PVector target = null;;
      if ((buttons[0].x < mouseX && buttons[0].x+buttons[0].w > mouseX) && (buttons[0].y < mouseY && buttons[0].y+buttons[0].h > mouseY)) {
        buttons[0].setIsHovered(true);
      }
      else if (filePath!=null && (buttons[1].x < mouseX && buttons[1].x+buttons[1].w > mouseX) && (buttons[1].y < mouseY && buttons[1].y+buttons[1].h > mouseY)) {
        buttons[1].setIsHovered(true);
      }
      else if ((buttons[2].x < mouseX && buttons[2].x+buttons[2].w > mouseX) && (buttons[2].y < mouseY && buttons[2].y+buttons[2].h > mouseY)) {
        buttons[2].setIsHovered(true);
      }
      else if ((buttons[3].x < mouseX && buttons[3].x+buttons[3].w > mouseX) && (buttons[3].y < mouseY && buttons[3].y+buttons[3].h > mouseY)) {
        buttons[3].setIsHovered(true);
      } else {
        for (Button b: buttons) {
          b.setIsHovered(false);
        }
      }

      break;
    case "TakeInput":
      selectInput("Select a file to process:", "fileSelected");
      mode = "MainMenu";
      break;
    case "Play":
      play.show();
      break;
    case "Settings":
      settings.show();
      break;
    case "Quit":
      exit();
      break;
  }
}

void mousePressed() {
  switch(mode) {
    case "MainMenu":
      if ((buttons[0].x < mouseX && buttons[0].x+buttons[0].w > mouseX) && (buttons[0].y < mouseY && buttons[0].y+buttons[0].h > mouseY)) {
        mode = "TakeInput";
      }
      else if (filePath!=null && (buttons[1].x < mouseX && buttons[1].x+buttons[1].w > mouseX) && (buttons[1].y < mouseY && buttons[1].y+buttons[1].h > mouseY)) {
        mode = "Play";
      }
      else if ((buttons[2].x < mouseX && buttons[2].x+buttons[2].w > mouseX) && (buttons[2].y < mouseY && buttons[2].y+buttons[2].h > mouseY)) {
        mode = "Settings";
      }
      else if ((buttons[3].x < mouseX && buttons[3].x+buttons[3].w > mouseX) && (buttons[3].y < mouseY && buttons[3].y+buttons[3].h > mouseY)) {
        mode = "Quit";
      }
      break;
    case "Play":
      if ((play.sg1Button.x < mouseX && play.sg1Button.x+play.sg1Button.w > mouseX) && (play.sg1Button.y < mouseY && play.sg1Button.y+play.sg1Button.h > mouseY)) {
        play.setPlayMode(game1);
        play.createSampleGame1();
      }
      if ((play.sg2Button.x < mouseX && play.sg2Button.x+play.sg2Button.w > mouseX) && (play.sg2Button.y < mouseY && play.sg2Button.y+play.sg2Button.h > mouseY)) {
        play.setPlayMode(game2);
        play.createSampleGame2();
      }
      
      if (play.getPlayMode()=="Play" && (play.backButton.x < mouseX && play.backButton.x+play.backButton.w > mouseX) && (play.backButton.y < mouseY && play.backButton.y+play.backButton.h > mouseY)) {
        mode = "MainMenu";
      }
    case "Settings":
      if(settings.b1.x<mouseX && settings.b1.x + settings.b1.w >mouseX && settings.b1.y<mouseY && settings.b1.y+settings.b1.h >mouseY)
      {
        settings.setMode("Colors");
      }
       if(settings.b2.x<mouseX && settings.b2.x + settings.b2.w >mouseX && settings.b2.y<mouseY && settings.b2.y+settings.b2.h>mouseY)
      {
        settings.setMode("Fonts");
      }
       /*if(settings.b3.x<mouseX && settings.b3.x + settings.b3.w >mouseX && settings.b3.y<mouseY && settings.b3.y+settings.b3.h>mouseY)
      {
        settings.setMode("displaySettings");
                fontsel();

      }*/
       if(settings.b4.x<mouseX && settings.b4.x + settings.b4.w >mouseX && settings.b4.y<mouseY && settings.b4.y+settings.b4.h>mouseY)
      {
        settings.setMode("Main Menu");
        mode = "MainMenu";
      }
      if(settings.getMode()=="Colors" && (settings.fontButton1.x<mouseX && settings.fontButton1.x + settings.fontButton1.w >mouseX && settings.fontButton1.y<mouseY && settings.fontButton1.y+settings.fontButton1.h>mouseY))
      {
        settings.applyColor1();
      }
      if(settings.getMode()=="Colors" && (settings.fontButton2.x<mouseX && settings.fontButton2.x + settings.fontButton2.w >mouseX && settings.fontButton2.y<mouseY && settings.fontButton2.y+settings.fontButton2.h>mouseY))
      {
        settings.applyColor2();
      }
      if(settings.getMode()=="Colors" && (settings.fontButton3.x<mouseX && settings.fontButton3.x + settings.fontButton3.w >mouseX && settings.fontButton3.y<mouseY && settings.fontButton3.y+settings.fontButton3.h>mouseY))
      {
        settings.applyColor3();
      }
      if(settings.getMode()=="Colors" && (settings.fontButton4.x<mouseX && settings.fontButton4.x + settings.fontButton4.w >mouseX && settings.fontButton4.y<mouseY && settings.fontButton4.y+settings.fontButton4.h>mouseY))
      {
        settings.applyColor4();
      }
      if(settings.getMode()=="Fonts" && (settings.textButton1.x<mouseX && settings.textButton1.x + settings.textButton1.w >mouseX && settings.textButton1.y<mouseY && settings.textButton1.y+settings.textButton1.h>mouseY))
      {
        settings.applyText1();
      }
      if(settings.getMode()=="Fonts" && (settings.textButton2.x<mouseX && settings.textButton2.x + settings.textButton2.w >mouseX && settings.textButton2.y<mouseY && settings.textButton2.y+settings.textButton2.h>mouseY))
      {
        settings.applyText2();
      }
      if(settings.getMode()=="Fonts" && (settings.textButton3.x<mouseX && settings.textButton3.x + settings.textButton3.w >mouseX && settings.textButton3.y<mouseY && settings.textButton3.y+settings.textButton3.h>mouseY))
      {
        settings.applyText3();
      }
      if(settings.getMode()=="Fonts" && (settings.textButton4.x<mouseX && settings.textButton4.x + settings.textButton4.w >mouseX && settings.textButton4.y<mouseY && settings.textButton4.y+settings.textButton4.h>mouseY))
      {
        settings.applyText4();
      }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (play.getPlayMode()==game1) {
      if (keyCode == UP) {
        play.sg1.gh.jump();
      }
    }
    else if(play.getPlayMode()==game2) {
      if (keyCode == RIGHT) {
        play.sg2.collector.shiftRight();
      } else if (keyCode == LEFT) {
        play.sg2.collector.shiftLeft();
      }
    }
  }
}
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    filePath = selection.getAbsolutePath();
    println("Successfully uploaded the file.");
  }
}
