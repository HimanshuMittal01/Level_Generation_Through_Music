import beads.*;
import java.util.Iterator;

class SampleGame2 {
  AudioContext ac;
  PeakDetector beatDetector;
  
  SamplePlayer player = null;
  float beatValue;
  int time;
  
  String timeStamps;
  
  ArrayList<Coin> coins;
  Collector collector;
  int score;
  
  StateManager2 sm2;
  int lane;
  long timer;
  double minTime;
  
  SampleGame2() {
    time = millis();
    
    ac = new AudioContext();
    Gain g = new Gain(ac, 2, 0.2);
    ac.out.addInput(g);
    
    try
    {
      player = new SamplePlayer(ac, new Sample(filePath));
      g.addInput(player);
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    
    ShortFrameSegmenter sfs = new ShortFrameSegmenter(ac);
    
    sfs.setChunkSize(1024);
    sfs.setHopSize(441);
    sfs.addInput(ac.out);
    
    FFT fft = new FFT();
    PowerSpectrum ps = new PowerSpectrum();
    
    sfs.addListener(fft);
    fft.addListener(ps);
    
    SpectralDifference sd = new SpectralDifference(ac.getSampleRate());
    ps.addListener(sd);
    
    beatDetector = new PeakDetector();
    sd.addListener(beatDetector);
    
    beatDetector.setThreshold(0.2f);
    beatDetector.setAlpha(.9f);
    
    beatDetector.addMessageListener
    (
      new Bead()
      {
        protected void messageReceived(Bead b)
        {
          beatValue = 1.0;
        }
      }
    );
    
    ac.out.addDependent(sfs);
    ac.start();
    
    //Game instantiating
    coins = new ArrayList<Coin>();
    coins.add(new Coin(0));
    collector = new Collector(100);
    
    timeStamps = "";
    timer = 0;
    minTime = 1000;
    sm2 = new StateManager2();
    lane = int(random(sm2.numLanes));
  }
  void show() {
    //we have to collect coins in this game
    //it will consist of three lanes
    
    background(0);
    textSize(32);
    text(score, 100, 100);
    
    
    
    //What happens after we detect beat
    if (beatValue > 0.5) {
        timeStamps += Double.toString(player.getPosition())+" ";
        text(Double.toString(player.getPosition()), int(width*0.9), height/2);
        long currentMillis = millis();
        if (millis() - timer> minTime) {
          lane += 1;
          lane %= sm2.numLanes;
          timer = currentMillis ;
        }
        coins.add(new Coin(lane));
    }
    
    for (Coin coin: coins) {
      coin.show();
      coin.update();
    }
    Iterator itr = coins.iterator(); 
        while (itr.hasNext()) 
        { 
            Coin coin = (Coin) itr.next();
            if (coin.getX()==collector.getX() + collector.getSize()/4 && (coin.getRadius() + coin.getY() > collector.getY())){
              itr.remove();
              score += 1;
            } else if (coin.getY() > height) {
              itr.remove();
            }
                
        }
    collector.show();
    
    // decrease beatValue over time
    int dt = millis() - time;
    beatValue -= (dt * 0.1);
    if (beatValue < 0) beatValue = 0;
    time += dt;
    
    // set threshold and alpha to the mouse position
    beatDetector.setThreshold((float)mouseX/height);
    beatDetector.setAlpha((float)mouseY/height);
    
    saveStrings("TimeStamps.txt", split(timeStamps, ' '));
  }
}
