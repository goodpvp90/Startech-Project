Image background = new Image();
Image dbackground = new Image();
Image bird = new Image();
Image UpObs = new Image();
Image DownObs = new Image();
Music backgroundM = new Music();
Music failure = new Music();
Music success = new Music();
Text scoreV = new Text();
Text lose = new Text();
int score = -1;



void setup() {
  size(900, 600);
  backgroundM.load("music.mp3");
  backgroundM.play();
  failure.load("failure.wav");
  success.load("sucess.wav");
  backgroundM.loop = true;
  background.setImage("background.jpg");
  dbackground.setImage("backgrounddown.jpg");
  bird.setImage("bird.png");
  UpObs.setImage("up.png");
  DownObs.setImage("down.png");
  UpObs.x = 0;
  UpObs.y = 0;
  UpObs.height = 200;
  DownObs.x = 0;
  DownObs.y = 400;
  DownObs.height = 200;
  bird.x = 0;
  bird.y = height/2;
  bird.width = 50;
  bird.height = 50;
  scoreV.x = 50;
  scoreV.y = 50;
  scoreV.textSize = 50;
  lose.x = 200;
  lose.y = 300;
  lose.textSize = 50;
}

void draw() {
  scoreV.text = str(score);
  lose.text = ("You Losed, Score :" + score);
  lose.brush = color (255,0,0);
  dbackground.x = 0;
  dbackground.y = 550;
  dbackground.width = 900;
  dbackground.height = 60;
  background.draw();
  dbackground.draw();
  scoreV.draw();
  bird.draw();
  UpObs.draw();
  DownObs.draw();
  UpObs.direction = Direction.LEFT;
  UpObs.speed = 5;
  DownObs.x = DownObs.x -5;
  if(UpObs.x < 0){
    UpObs.x = 880;
    DownObs.x = 880;
    UpObs.height = int(random(200,400));
  }
  bird.direction = Direction.DOWN;
  bird.speed = 1;
  if (bird.x == UpObs.x){
    if(score > -1){
    success.play();
    }
    score = score + 1;
  }
  if ( bird.y <= 20 || bird.y >= 580){
    noLoop();
    backgroundM.stop();
    failure.play();
    background(0,0,0);
    lose.draw();
  }
  if(UpObs.pointInShape(bird.x, bird.y)){
    noLoop();
    backgroundM.stop();
    failure.play();
    background(0,0,0);
    lose.draw();
  }
  
    if(DownObs.pointInShape(bird.x, bird.y)){
    noLoop();
    backgroundM.stop();
    failure.play();
    background(0,0,0);
    lose.draw();
  }
 
}  

void mousePressed() {
    bird.direction = Direction.UP;
    bird.speed = 20;
}
