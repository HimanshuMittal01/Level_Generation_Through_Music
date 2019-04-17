public class Button {
  private int x; //x-Position
  private int y; //y-Position
  private float xOffPer; //percentage offest in x axis from left
  private float yOffPer; //percentage offest in y axis from top
  private int w; //width
  private int h; //height
  private String buttonText; //text
  private boolean isHovered = false;
  
  //Displat Settings
  //Default values
  private color foregroundColor = color(255);
  private color backgroundColor = color(255);
  private float foregroundAlpha = 255;
  private float backgroundAlpha = 255;
  private boolean setGradient = false;
  private color gradColor1 = color(#ff6434);
  private color gradColor2 = color(#a30000);
  
  Button(String text, float xOffPer, float yOffPer, int w, int h, boolean setGradient) {
    if (xOffPer<0 || xOffPer>1 || yOffPer<0 || yOffPer>1) {
      try {
        throw new MyException("Offset Percentage for axis must lie between 0 and 1");
      }
      catch(MyException e) {
        println(e);
      }
    }
    this.xOffPer = xOffPer;
    this.yOffPer = yOffPer;
    this.w = w;
    this.h = h;
    
    this.x = (int) (this.xOffPer*width);
    this.y = (int) (this.yOffPer*height);
    
    this.setGradient = setGradient;
    this.buttonText = text;
  }
  public void show() {
    textFont(fontHeading);
    if (!isHovered) {
      if (setGradient) {
        setGradient(gradColor1, gradColor2, 0);
      } else {
        fill(backgroundColor, backgroundAlpha);
        rect(x,y,w,h);
      }
      fill(foregroundColor, foregroundAlpha);
      textSize(32);
      text(buttonText, x+w*0.1, y+h-h*0.3);
    } else {
      //hovering animation
      x -= 5; y -= 5; h += 10; w += 10;
      stroke(255);
      if (setGradient) {
        setGradient(gradColor1, gradColor2, 0);
      } else {
        fill(backgroundColor, backgroundAlpha);
        rect(x,y,w,h);
      }
      fill(255);
      rect(x+w, y+h/2, w/10, h/10);
      x += 5; y += 5; h -= 10; w -= 10;
      fill(foregroundColor, foregroundAlpha);
      textSize(32+6);
      text(buttonText, x+w*0.1, y+h-h*0.3);
    }
  }
  public boolean getIsHovered() {
    return isHovered;
  }
  public void setIsHovered(boolean isHovered) {
    this.isHovered = isHovered;
  }
  protected void setGradient(color c1, color c2, int axis) {
    noFill();
    if (axis==0) {
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
    else if (axis==1) {
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }
    else {
      try {
        throw new MyException("Value can be either 0 or 1 for x-axis and y-axis respectively.");
      }
      catch(MyException e) {
        println(e);
      }
    }
  }
  public void setText(String text) {
    this.buttonText = text;
  }
  
  
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public float getxOffPer() {
    return xOffPer;
  }

  public void setxOffPer(float xOffPer) {
    this.xOffPer = xOffPer;
  }

  public float getyOffPer() {
    return yOffPer;
  }

  public void setyOffPer(float yOffPer) {
    this.yOffPer = yOffPer;
  }

  public int getW() {
    return w;
  }

  public void setW(int w) {
    this.w = w;
  }

  public int getH() {
    return h;
  }
  public void setH(int h) {
    this.h = h;
  }
  public String getButtonText() {
    return buttonText;
  }
  public void setButtonText(String buttonText) {
    this.buttonText = buttonText;
  }
  public float getForegroundAlpha() {
    return foregroundAlpha;
  }
  public void setForegroundAlpha(float foregroundAlpha) {
    this.foregroundAlpha = foregroundAlpha;
  }
  public float getBackgroundAlpha() {
    return backgroundAlpha;
  }
  public void setBackgroundAlpha(float backgroundAlpha) {
    this.backgroundAlpha = backgroundAlpha;
  }
  public boolean isSetGradient() {
    return setGradient;
  }
  public void setSetGradient(boolean setGradient) {
    this.setGradient = setGradient;
  }
  public color getBackgroundColor() {
    return backgroundColor;
  }

  public void setBackgroundColor(color backgroundColor) {
    this.backgroundColor = backgroundColor;
  }
  public void setGradColor1(color gradcolor) {
    this.gradColor1 = gradcolor;
  }
  public void setGradColor2(color gradcolor) {
    this.gradColor2 = gradcolor;
  }

  public color getForegroundColor() {
    return foregroundColor;
  }

  public void setForegroundColor(color foregroundColor) {
    this.foregroundColor = foregroundColor;
  }
}
