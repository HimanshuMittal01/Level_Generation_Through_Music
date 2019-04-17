class Settings{
  ArrayList<Button> buttons;
  
  String mode;
  String ib;
  PFont font1;
  PFont font2;
  int set=0;//for font and theme
  int xr,xg,xb;
  DropdownList d1, d2;
  Button b1,b2,b3,b4;
  Button fontButton1, fontButton2, fontButton3, fontButton4;
  Button textButton1, textButton2, textButton3, textButton4;
  
  boolean settingsCompleted = false; //Will be true when adjusted display settings
  
  HScrollbar settingsBar;
  
  Settings() {
    b1=new Button("Color",0.2,0.4,300,50,true);
    b2=new Button("Font",0.2,0.5,300,50,true);
    b3=new Button("Size of Window",0.2,0.6,300,50,true);
    b4=new Button("Back",0.2,0.7,300,50,true);
    
    fontButton1 = new Button("Harvey", 0.6, 0.4, 300, 50, true);
    fontButton2 = new Button("Blue Raspberry", 0.8, 0.4, 300, 50, true);
    fontButton3 = new Button("Expresso", 0.6, 0.5, 300, 50, true);
    fontButton4 = new Button("Default", 0.8, 0.5, 300, 50, true);
    textButton1 = new Button("Arial", 0.6, 0.4, 300, 50, true);
    textButton2 = new Button("Gabriola", 0.8, 0.4, 300, 50, true);
    textButton3 = new Button("MVBoli-48", 0.6, 0.5, 300, 50, true);
    textButton4 = new Button("Default", 0.8, 0.5, 300, 50, true);
    mode="Settings";
    
    buttons = new ArrayList<Button>();
    buttons.add(b1);
    buttons.add(b2);
    buttons.add(b3);
    buttons.add(b4);
    buttons.add(fontButton1);
    buttons.add(fontButton2);
    buttons.add(fontButton3);
    buttons.add(fontButton4);
    buttons.add(textButton1);
    buttons.add(textButton2);
    buttons.add(textButton3);
    buttons.add(textButton4);
    settingsBar = new HScrollbar(width*0.55, height/2-8, width/4, 16, 16);
  }
  void show() {
    //This just works as draw method in main class
    //so write it like draw
    background(20);
    textSize(48);
    stroke(50, 100, 220);
    
    //Probably be changing these hardcoded values later on
    text("Settings", 100, 100);
    
    //Let us show buttons
    b1.show();
    b2.show();
    b3.show();
    b4.show();
    
    textSize(32);
    text("Still under development (Size of window)", width/2, height/6);
    text("Backend is completed but clicks are yet to control.", width/2, height/6+75);
    
    if ((b1.x < mouseX && b1.x+b1.w > mouseX) && (b1.y < mouseY && b1.y+b1.h > mouseY)) {
      b1.setIsHovered(true);
    }
    else if ((b2.x < mouseX && b2.x+b2.w > mouseX) && (b2.y < mouseY && b2.y+b2.h > mouseY)) {
      b2.setIsHovered(true);
    }
    else if (settingsCompleted && (b3.x < mouseX && b3.x+b3.w > mouseX) && (b3.y < mouseY && b3.y+b3.h > mouseY)) {
      b3.setIsHovered(true);
    } else if ((b4.x < mouseX && b4.x+b4.w > mouseX) && (b4.y < mouseY && b4.y+b4.h > mouseY)) {
      b4.setIsHovered(true);
    } else {
      b1.setIsHovered(false);
      b2.setIsHovered(false);
      b3.setIsHovered(false);
      b4.setIsHovered(false);
    }
    
    switch (mode)
    {
      case "Colors":
        colors();
        break;
      case "Fonts":
        fonts();
      break;
      /*case "displaySettings":
        settingsBar.update();
        settingsBar.display();
        
        //surface.setSize(int(settingsBar.getPos()), height);
        break;*/ 
    }
  }
  void colors() {
    fontButton1.show();
    fontButton2.show();
    fontButton3.show();
    fontButton4.show();
    if ((fontButton1.x < mouseX && fontButton1.x+fontButton1.w > mouseX) && (fontButton1.y < mouseY && fontButton1.y+fontButton1.h > mouseY)) {
      fontButton1.setIsHovered(true);
    }
    else if ((fontButton2.x < mouseX && fontButton2.x+fontButton2.w > mouseX) && (fontButton2.y < mouseY && fontButton2.y+fontButton2.h > mouseY)) {
      fontButton2.setIsHovered(true);
    }
    else if ((fontButton3.x < mouseX && fontButton3.x+fontButton3.w > mouseX) && (fontButton3.y < mouseY && fontButton3.y+fontButton3.h > mouseY)) {
      fontButton3.setIsHovered(true);
    } else if ((fontButton4.x < mouseX && fontButton4.x+fontButton4.w > mouseX) && (fontButton4.y < mouseY && fontButton4.y+fontButton4.h > mouseY)) {
      fontButton4.setIsHovered(true);
    } else {
      fontButton1.setIsHovered(false);
      fontButton2.setIsHovered(false);
      fontButton3.setIsHovered(false);
      fontButton4.setIsHovered(false);
    }
  }
  void applyColor1() {
    for (Button b: buttons) {
      b.setGradColor1(color(#99f2c8));
      b.setGradColor2(color(#1f4037));
      b.setForegroundColor(color(#fce4ec));
    }
  }
  void applyColor2() {
    for (Button b: buttons) {
      b.setGradColor1(color(#00B4DB));
      b.setGradColor2(color(#0083B0));
      b.setForegroundColor(color(#fce4ec));
    }
  }
  void applyColor3() {
    for (Button b: buttons) {
      b.setGradColor1(color(#ad5389));
      b.setGradColor2(color(#3c1053));
      b.setForegroundColor(color(#ffffff));
    }
  }
  void applyColor4() {
    for (Button b: buttons) {
      b.setGradColor1(color(#ff6434));
      b.setGradColor2(color(#a30000));
      b.setForegroundColor(color(#ffffff));
    }
  }
  void fonts() {
    textButton1.show();
    textButton2.show();
    textButton3.show();
    textButton4.show();
    if ((textButton1.x < mouseX && textButton1.x+textButton1.w > mouseX) && (textButton1.y < mouseY && textButton1.y+textButton1.h > mouseY)) {
      textButton1.setIsHovered(true);
    }
    else if ((textButton2.x < mouseX && textButton2.x+textButton2.w > mouseX) && (textButton2.y < mouseY && textButton2.y+textButton2.h > mouseY)) {
      textButton2.setIsHovered(true);
    }
    else if ((textButton3.x < mouseX && textButton3.x+textButton3.w > mouseX) && (textButton3.y < mouseY && textButton3.y+textButton3.h > mouseY)) {
      textButton3.setIsHovered(true);
    } else if ((textButton4.x < mouseX && textButton4.x+textButton4.w > mouseX) && (textButton4.y < mouseY && textButton4.y+textButton4.h > mouseY)) {
      textButton4.setIsHovered(true);
    } else {
      textButton1.setIsHovered(false);
      textButton2.setIsHovered(false);
      textButton3.setIsHovered(false);
      textButton4.setIsHovered(false);
    }
  }
   void applyText1() {
    fontHeading = loadFont("Arial-BoldMT-48.vlw");
  }
  void applyText2() {
    fontHeading = loadFont("Gabriola-48.vlw");
  }
  void applyText3() {
    fontHeading = loadFont("MVBoli-48.vlw");
  }
  void applyText4() {
    fontHeading = loadFont("SegoePrint-48.vlw");
  }
  public void setMode(String mode) {
    this.mode = mode;
  }
  public String getMode() {
    return this.mode;
  }
  void controlEvent(ControlEvent theEvent) {
    // if the event is from a group, which is the case with the dropdownlist
    if (theEvent.isGroup()) {
      /*if (theEvent.name() == "myList-d1") {
        ListBoxItem si = dropdown.getItem((int)theEvent.value());
        if(si==1)
        {
          font1 = loadFont("Arial-BoldMT-48.vlw");
          set=1;
        textFont(font1, 100);
        //text("Witness Harmony", 600, 100);
       
          
        }
        if(si==2)
        {
          font2 = loadFont("SansSerif.italic-48.vlw");
          set=2;
        textFont(font2, 100);
        //text("Witness Harmony", 600, 100);
       
          
        }
      }
      if (theEvent.group().name() == "myList-d2") {
        ListBoxItem si = dropdown.getItem((int)theEvent.value());
        if(si==1)
        {
         xr=15;xg=35;xb=240;
          
        }
        if(si==2)
        {
          xr=92;xg=178;xb=18;
         
         }
      }
      } else if(theEvent.isController()) {
      println(theEvent.controller().value()+" from "+theEvent.controller()); 
    }*/
    }
  }

}
