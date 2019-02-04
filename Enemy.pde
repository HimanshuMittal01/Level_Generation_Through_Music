public class Enemy {
  int x, y;
  int size = 30;
  int thickness = 10; //width
  
  float yspeed = 0;
  float dt = 0.01f;
  
  
  Enemy(int _x, int _y) {
    x = _x;
    y = _y;
  }
  public void move() {
    x -=1 ;
  }
  public void update() {
    if (y + size < height - platformHeight) {
      y += yspeed;
      yspeed += gravity*dt;
    }
  }
  public void show() {
    rect(x, y, thickness, size);
  }
    
}
