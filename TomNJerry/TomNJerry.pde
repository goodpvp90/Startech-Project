Image background = new Image();
Music backgroundMusic = new Music();
Music successMusic = new Music();
Music failMusic = new Music();
Image tom = new Image();
Image jerry = new Image();
Image heart1 = new Image();
Image heart2 = new Image();
Image heart3 = new Image();
int hearts = 3;
int success = 0;
Text score = new Text();
Text win = new Text();
Text lose = new Text();

void setup() {
  size(1080, 1080);
  background.setImage("background.jpg");
  backgroundMusic.load("background1.mp3");
  successMusic.load("success.wav");
  failMusic.load("fail.mp3");
  backgroundMusic.loop = true;
  backgroundMusic.play();
  tom.setImage("tom.png");
  tom.x = (1000-202)/2;
  tom.y = 1080-322;
  heart1.setImage("heart.png");
  heart2.setImage("heart.png");
  heart3.setImage("heart.png");
  jerry.setImage("jerry.png");
  jerry.height = 50;
  jerry.width = 50;
  jerry.x = (1000-50)/2;
  jerry.y = 0;
  jerry.direction = Direction.DOWN;
  jerry.speed = 5;
  heart1.x = 800;
  heart1.y = 50;
  heart1.width = 50;
  heart1.height = 50;
  heart2.x = 850;
  heart2.y = 50;
  heart2.width = 50;
  heart2.height = 50;
  heart3.x = 900;
  heart3.y = 50;
  heart3.width = 50;
  heart3.height = 50;
  score.x = 100;
  score.y = 100;
  score.brush= color(100,100,100);
  score.textSize = 50;
  win.x = width/2;
  win.y = height/2;
  win.brush = color(255,0,0);
  win.textSize = 50;
  win.text = "YOU WON!";
  lose.x = width/2;
  lose.y = height/2;
  lose.brush = color(255,0,0);
  lose.textSize = 50;
  lose.text = "YOU LOSED!";

 
}

void draw() {
  background.draw(); 
  score.text = "Score:" + success;  
  score.draw();
  if (hearts == 3){
   heart1.draw();
   heart2.draw();
   heart3.draw();
  } else if (hearts == 2){
    heart1.draw();
    heart2.draw();
  } else if (hearts == 1){
    heart1.draw();
  } 
    tom.draw();  
    jerry.draw();
    if (hearts == 3){
      heart1.draw();
      heart2.draw();
      heart3.draw();
    }
    
    if (keyCode == RIGHT){
      if ( tom.x + tom.width< 1000){
     tom.x = tom.x + 10;
 }} if (keyCode == LEFT){
      if ( tom.x > 0){
     tom.x = tom.x - 10;
   }}if (keyCode == UP){
     tom.x = tom.x;
   }
    if (jerry.y > height ){
      jerry.y = 0;
      jerry.x = (int)random(0,1000-jerry.width);
    }
    if (tom.pointInShape(jerry.x, jerry.y)){
      successMusic.play();
      jerry.y = 0;
      success += 1;
      jerry.x = (int)random(0,1000-jerry.width);
    } else if(jerry.y == 0){
      failMusic.play();
      hearts = hearts - 1;
    }
    
    if (success == 10){
      backgroundMusic.stop();
      successMusic.stop();
      failMusic.stop();
      background(255,255,255);
      win.draw();
    } if (hearts <= 0){
      backgroundMusic.stop();
      successMusic.stop();
      failMusic.stop();
      background(255,255,255);
      lose.draw();
    }
}

void keyPressed(){



}

void keyReleased(){
  
}
