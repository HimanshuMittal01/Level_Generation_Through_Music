class MyException extends Exception {
  String message;
  MyException(String str) {
    message = str;
  }
  public String toString() {
    return ("MyException Occured: "+message);
  }
}
