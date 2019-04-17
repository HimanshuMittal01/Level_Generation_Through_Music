class Play{
  //This class will have real control of games
  //It will be acting as secondary main menu for games
  
  Button sg1Button, sg2Button, backButton;
  SampleGame1 sg1;
  SampleGame2 sg2;
  public boolean isSG1Created;
  public boolean isSG2Created;
  private String playMode;
  Play() {
    //This acts as setup, really cool!
    sg1Button = new Button("Sample game 1", 0.4, 0.4, 300, 50, true);
    sg2Button = new Button("Sample game 2", 0.4, 0.5, 300, 50, true);
    backButton = new Button("Back", 0.8, 0.9, 200, 50, true);
    playMode = "Play";
    
    isSG1Created = false;
    isSG2Created = false;
  }
  
  void show() {
    //This just works as draw method in main class
    //so write it like draw
    switch(playMode) {
      case "Play":
        background(20);
        textSize(48);
        stroke(50, 100, 220);
        text("Play", 100, 100);
        sg1Button.show();
        sg2Button.show();
        backButton.show();
        
        if ((sg1Button.x < mouseX && sg1Button.x+sg1Button.w > mouseX) && (sg1Button.y < mouseY && sg1Button.y+sg1Button.h > mouseY)) {
          sg1Button.setIsHovered(true);
        }
        else if ((sg2Button.x < mouseX && sg2Button.x+sg2Button.w > mouseX) && (sg2Button.y < mouseY && sg2Button.y+sg2Button.h > mouseY)) {
          sg2Button.setIsHovered(true);
        }
        else if ((backButton.x < mouseX && backButton.x+backButton.w > mouseX) && (backButton.y < mouseY && backButton.y+backButton.h > mouseY)) {
          backButton.setIsHovered(true);
        } else {
          sg1Button.setIsHovered(false);
          sg2Button.setIsHovered(false);
          backButton.setIsHovered(false);
        }
        break;
      case game1:
        sg1.show();
        break;
      case game2:
        sg2.show();
        break;
    }
  }
  public void createSampleGame1() {
    sg1 = new SampleGame1();
  }
  public void createSampleGame2() {
    sg2 = new SampleGame2();
  }
  public String getPlayMode() {
    return this.playMode;
  }
  public void setPlayMode(String playMode) {
    this.playMode = playMode;
  }
}
