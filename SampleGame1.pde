import beads.*;
class SampleGame1 {
  AudioContext ac;
  PeakDetector beatDetector;
  
  float beatValue;
  int time; // tracks the time
  
  //game variables
  ArrayList<Enemy> enemies;
  GameHero gh;
  StateManager1 stateManager1;
  String timeStamps;
  
  SamplePlayer player = null;
  SampleGame1()
  {
    time = millis();
    
    // set up the AudioContext and the master Gain object
    ac = new AudioContext();
    Gain g = new Gain(ac, 2, 0.2);
    ac.out.addInput(g);
    
    // load up a sample included in code download
    //SamplePlayer player = null;
    try
    {
      player = new SamplePlayer(ac, new Sample(filePath)); // load up a new SamplePlayer using an included audio file
      g.addInput(player); // connect the SamplePlayer to the master Gain
    }
    catch(Exception e)
    {
      e.printStackTrace(); // if there is an error, print the steps that got us to that error
    }  
    
    // set up the ShortFrameSegmenter
    // this class allows us to break an audio stream into discrete chunks
    ShortFrameSegmenter sfs = new ShortFrameSegmenter(ac);
    
    //I would also like to change this to increase the gap between two beats.
    sfs.setChunkSize(1024); // how large is each chunk?
    sfs.setHopSize(441);
    sfs.addInput(ac.out); // connect the sfs to the AudioContext
    
    FFT fft = new FFT();
    PowerSpectrum ps = new PowerSpectrum();
    
    sfs.addListener(fft);
    fft.addListener(ps);
    
    // the SpectralDifference unit generator does exactly what it sounds like
    // it calculates the difference between two consecutive spectrums returned by an FFT (through a PowerSpectrum object)
    SpectralDifference sd = new SpectralDifference(ac.getSampleRate());
    ps.addListener(sd);
    
    // we will use the PeakDetector object to actually find our beats
    beatDetector = new PeakDetector();
    sd.addListener(beatDetector);
    
    // the threshold is the gain level that will trigger the beat detector - this will vary on each recording
    //We need to change this through algorithm for different music
    beatDetector.setThreshold(0.2f);
    beatDetector.setAlpha(.9f);
   
    // whenever our beat detector finds a beat, set a global variable 
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
    
    ac.out.addDependent(sfs); // tell the AudioContext that it needs to update the ShortFrameSegmenter
    ac.start(); // start working with audio data
    
    enemies = new ArrayList<Enemy>();
    gh = new GameHero(100, 100);
    stateManager1 = new StateManager1();
    timeStamps = "";
  }
  
  // the draw method draws a shape on screen whwenever a beat is detected
  void show()
  {
    background(0);
  
    //create platform
    fill(150, 50, 50);
    rect(0, height-stateManager1.platformHeight, width, stateManager1.platformHeight);
    
    if (beatValue >0.5) {
      //if (ao.timeReduce(nextSpawn, lastSpawn)) {
        timeStamps += Double.toString(player.getPosition())+" ";  
        text(Double.toString(player.getPosition()), width/4, height/2);
        enemies.add(new Enemy(width*3/4, height/2, 50));
      //  lastSpawn = nextSpawn;
      //} else {
      //  nextSpawn += 0.01;
      //}
    }
    
    fill(255);
    for (Enemy enemy: enemies) {
      enemy.show();
      enemy.move();
      enemy.update();
    }
    
    gh.show();
    gh.update();
    
    // decrease beatValue over time
    int dt = millis() - time;
    beatValue -= (dt * 0.05);
    if (beatValue < 0) beatValue = 0;
    time += dt;
    
    // set threshold and alpha to the mouse position
    beatDetector.setThreshold((float)mouseX/height);
    beatDetector.setAlpha((float)mouseY/height);
    
      
    saveStrings("TimeStamps.txt", split(timeStamps, ' '));
  }
}
