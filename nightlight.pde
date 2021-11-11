import processing.sound.*;

import gifAnimation.*;
import processing.io.*;

Gif talking;
Gif idle;
boolean on;
boolean startPlaying;
StringList stories;
float rand;
float hover = 0;
//SoundFile soundfile;
SoundFile[] soundfiles;
void setup() {
  println("gifAnimation " + Gif.version());
  GPIO.pinMode(17, GPIO.INPUT);
  on = false;
  size(800, 600);
  //fullScreen();
  imageMode(CENTER);

  stories = new StringList();
  stories.append("My question and got moved from it was in a way that she would be dragons? Because his wife and younger gentleman come in every Friday and Saturday nights at my bar and a mathematician. With logic like it with got pregant woman to her prior that was absolutely paying attention because I couldn't be getting tipy. Bob and Linda walk up and she's so keep to get any updates but I had the plate and coke, I was too scared to say that was me, I told there was no joking demeanor responds 'weed is getting tipy. Bob and Linda who are all fantastic singer. ME - 'HER name is Laura' Farmer-'I CANT GO TO JAIL IVE GOT LAMBS!");
  stories.append("When I was younger. Two women, early twenties my best friend who had been dead for 14 years. So that was mostly empty and a guy whip out her whole boob in the bar. One day an enormous rat tumbles down from the sweltering heat. They sit at the bar with my name and were having a drink and don't take any more 50s from the bush at a hostel bar in German for a few minutes until a busboy pulled me aside to be professionally cleaned later. The one standing ovation as they crawled out of the bathroom. She on the other end of the bartender made the decision to cut her off. The dead bartender, at a golf course many moons ago. It was clear to me he was a part of a gang, but becuase it was such disgusting with this story. He was completely unresponsive so we called Fabio becaue he is so hungry. I cannot make the devil blush.");
  stories.append("Had a customer service I get a call...Directly across the street after it happen for me, the other and smiling, the works. I call sercurity and it moving into company property in the cocktail bar. Proceeds to lower his pants while downing budweisers. 7am-close. Every. Single. Day. Until the day he literally could not get more karma how do i do that?");
  stories.append("I used to go to daily. Talking about some waitress that was more men networking doing business and I don't judge, not my place, you do you boo boo... OK so now to the well with another man something would risk his job, but he insisted she get a ride home with us about sucking dick isn't cheating on her and tipping her more than likely die in the next day or two and wanted one last drink before telling the police. The guilty man was arrested for impersonating a soldier and doing some of undergrad. I overheard was a woman. Eventually I overheard a couple of jackets off the dick of some fetish. She said she was just like a coked out Fabio. He was in the section right next to his terrible home life and wouldn't serve his kind. He walks out. All the while they gold all day. Totally fine with me, I absolutely hammered and never looks up at me after ordering. Picks up the phone and interesting time with someone else earlier that day.");

  talking = new Gif(this, "processingtalking_0gkYoZzS.gif");
  talking.loop();

  idle = new Gif(this, "processingawakeidle-round_Rfdu1wzM.gif");
  idle.loop();

  soundfiles = new SoundFile[8];
  for (int i = 0; i < 8; i++) {
    println((i+1) + ".wav");
    soundfiles[i] = new SoundFile(this, (i+1) + ".wav");
  }

  startPlaying = false;
  //soundfile = new SoundFile(this, "chaos1.wav");
  //soundfile.play();
}

void draw() {
  background(11, 190, 130);
  //noStroke();
  //fill(122, 100);
  //rect(0,0,width,height);
  //println(GPIO.digitalRead(17));

  if (!(soundfiles[0].isPlaying() ||
    soundfiles[1].isPlaying() ||
    soundfiles[2].isPlaying() ||
    soundfiles[3].isPlaying() ||
    soundfiles[4].isPlaying() ||
    soundfiles[5].isPlaying() ||
    soundfiles[6].isPlaying() ||
    soundfiles[7].isPlaying())
    ) {
    if (GPIO.digitalRead(17) == GPIO.HIGH && !on) {
      on = true;
      rand = random(8);
      startPlaying = true;
      delay(300);
      println("buttonPush");
    } else if (on && startPlaying) {
      delay(300);
      soundfiles[floor(rand)].play();
      soundfiles[floor(rand)].amp(1.0);
      //soundfiles[floor(rand)].play();
      println("in on and start playing");
      startPlaying = false;
    } else {
      image(idle, (width/2)+60, height/2 + 3*sin(hover)-7);
    }
  } else {
    image(talking, (width/2)+60, height/2 + 3*sin(hover)-7);
     on = false;
  }
  hover+=.05;
  //if (on) {
  //  int num = floor(rand);
  //  String story = stories.get(0);
  //  String[] words = splitTokens(story);
  //  for (int i = 0; i < words.length; i++ ) {
  //    background(11, 190, 130);
  //    fill(255);
  //    textSize(12);
  //    println(words[i]);
  //    text(words[i] + " ", width/6 * (i % 5), height*(i%5)/6);
  //  }
  //}
}
