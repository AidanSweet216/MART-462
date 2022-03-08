var x = 0;
var y = 0;
var circX = 785;
var circY = 368;
var squareX = [];
var squareY = [];
var speedX = 10;
var speedY = 10;
var timerValue = 30;
var myImages = [];
var start = 100;
let img;
let myFont;
function preload() {
  img = loadImage('assets/ice.jpg');
  myImages[0] = img
  img = loadImage('assets/monte.png')
  myImages[1] = img
  myFont = loadFont('assets/Rowdies-Regular.ttf');
}


function setup()
{
    createCanvas(windowWidth-20, windowHeight-20);
    setInterval(timeIt, 1000);
    img = loadImage('assets/ice.jpg');
    squareX [1] = 105;
    squareX [2] = 1400;
    squareX [3] = 125;
    squareY [1] = 368;
    squareY [2] = 850;
    textFont(myFont);
    textSize(36);
    text('p5*js', 10, 50);
  
 

    
   

    
}
function draw()
{
    background(220);
    image(myImages[0], 0, 0,);
    //translate(0,0);
    //rotate(90);
    //image(myImages[1],circX,circY, 70,70);
    push();
    translate(start + x, height/2-100); 
    // then rotate the grid around the pivot point by a
    // number of degrees equal to the frame count of the sketch
    rotate(radians(frameCount));
    imageMode(CENTER);
    image(myImages[1],0,0, 75, 75);
    pop();
    if(x < 0 || x > width)
    {
        speedX *= -1;
    }
    x+=speedX;

    square(squareX[1],squareY[1],100);
    square(squareX[2],squareY[1],100);
    square(squareX[3],squareY[2],150);
    text(x +"and"+ y, 100, 300);
    textSize(42);
    text("Griz Pong", 650, 34);
    text("By: Aidan Sweet", 1171, 857);
    text("Back", 150, 925);
    moveSquare();

   if (timerValue >= 30) {
    text("0:" + timerValue, 700,  70);
  }
  if (timerValue < 30) {
    text('0:' + timerValue, 700, 70);
  }
  if (timerValue == 0) {
    text('Game Over',  700, 100);
    speedX = 0;
  }

  
    if (circX >= 1350)
    {
        speedX = 10;
        speedX = -speedX;
    }
    else if (circX < 105)
    {
        speedX = 10;
    }
    circX = circX + speedX;

  }

function mouseMoved()
{
    x = mouseX;
    y = mouseY;
}

function moveSquare()
{
    if(keyIsPressed)
    {
      
      
       if(key == 'w')
      {
        squareY[1]-=5;
      }
      else if(key == 's')
      {
        squareY[1]+=5;
      }
    }
    }
    function timeIt() {
      if (timerValue > 0) {
        timerValue--;
      }
      
    }


