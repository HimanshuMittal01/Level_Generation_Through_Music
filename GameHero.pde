public class GameHero {
  int x, y;
  int size = 50;
  int thickness = 10; //width
  
  float yspeed = 0;
  float jumpSpeed = 7;
  float dt = 0.01f;
  boolean jumping = false;
  boolean midAir = false;
  int startingJumpPosition;
  
  
  GameHero(int _x, int _y) {
    x = _x;
    y = _y;
  }
  public void jump() {
    if (!jumping) {
      jumping = true;
      startingJumpPosition = y;
    }
  }
  public void update() {
    if (!jumping) {
      if (y + size < height - platformHeight) {
        y += yspeed;
        yspeed += gravity*dt;
      }
    } else {
      setUpwardVelocity(-jumpSpeed);
      y += yspeed;
      yspeed += gravity*dt;
      midAir = true;
      if (y + size/10 > startingJumpPosition) {
        jumping = false;
        yspeed = 0;
        midAir = false;
      }
    }
  }
  private void setUpwardVelocity(float speed) {
    if (!midAir) {
      yspeed = speed;
    }
  }
  public void show() {
    rect(x, y, thickness, size);
  }
    
}
