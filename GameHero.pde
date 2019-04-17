public class GameHero {
  int x, y;
  int size = 70;
  int thickness = 15; //width
  
  float yspeed = 0;
  float jumpSpeed = 9;
  float dt = 0.01f;
  boolean jumping = false;
  boolean midAir = false;
  int startingJumpPosition;
  
  StateManager1 stateManager1;
  
  GameHero(int _x, int _y) {
    x = _x;
    y = _y;
    
    stateManager1 = new StateManager1();
  }
  public void jump() {
    if (!jumping) {
      jumping = true;
      startingJumpPosition = y;
    }
  }
  public void update() {
    if (!jumping) {
      if (y + size < height - stateManager1.platformHeight) {
        y += yspeed;
        yspeed += stateManager1.gravity*dt;
      }
    } else {
      setUpwardVelocity(-jumpSpeed);
      y += yspeed;
      yspeed += stateManager1.gravity*dt;
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
    fill(255);
    rect(x, y, thickness, size);
  }
    
}
