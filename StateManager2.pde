class StateManager2 {
  //global variables
  //default values
  public int gravity;
  public int paLeftX;
  public int paRightX;
  public int numLanes;
  public int gap;
  
  StateManager2() {
    gravity = 30;
    paLeftX = width/4;
    paRightX = 3*width/4;
    numLanes = 3;
    gap = (paRightX - paLeftX)/numLanes;
  }
}
