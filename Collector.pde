class Collector {
  private int size;
  private int x, y;
  private int curLane;
  
  StateManager2 stateManager2;
  Collector(int s) {
    stateManager2 = new StateManager2();
    curLane = int(random(0, stateManager2.numLanes));
    
    size = s;
    x = stateManager2.paLeftX + stateManager2.gap*curLane - size/4;
    y = height-size;
  }
  public void shiftRight() {
    if (curLane < stateManager2.numLanes-1) {
      curLane += 1;
      x = stateManager2.paLeftX + stateManager2.gap*curLane - size/4;
    }
  }
  public void shiftLeft() {
    if (curLane > 0) {
      curLane -= 1;
      x = stateManager2.paLeftX + stateManager2.gap*curLane - size/4;
    }
  }
  public void show() {
    rect(x, y, size*.5, size);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getSize() {
    return size;
  }
}
