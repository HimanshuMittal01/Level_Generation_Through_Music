public class Enemy {
  int x, y;
  int size;
  int thickness = 10; //width
  float xspeed = -3;
  float yspeed = 0;
  float dt = 0.01f;
  
  StateManager1 stateManager1;
  
  Enemy(int _x, int _y, int s) {
    x = _x;
    y = _y;
    size = s;
    
    stateManager1 = new StateManager1();
  }
  public void move() {
    x +=xspeed ;
  }
  public void update() {
    if (y + size < height - stateManager1.platformHeight) {
      y += yspeed;
      yspeed += stateManager1.gravity*dt;
    }
  }
  public void show() {
    fill(size*7, 100, 100);
    triangle(x-3,y, x+thickness+3, y, x+thickness/2, y - 10);
    rect(x, y, thickness, size);
  }
    
}
