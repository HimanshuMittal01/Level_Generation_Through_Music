class Coin {
  private float radius;
  private int x, y;
  float yspeed;
  float dt = 0.01f;
  
  StateManager2 stateManager2;
  Coin(int myLane) {
    stateManager2 = new StateManager2();
    x = stateManager2.paLeftX + stateManager2.gap*myLane;
    radius = random(20, 30);
  }
  public void update() {
      y += yspeed;
      yspeed += stateManager2.gravity*dt;
  }
  public void show() {
    fill(50, 200, 200);
    ellipse(x, y, radius, radius);
  }
  public float getRadius() {
    return radius;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
