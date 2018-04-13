//variables
Cubie cube1,cube2;
Catty cat;
int r,g,b,m,k;
float posx,posy;
PImage[] cats = new PImage[8];
PImage BG = new PImage();
PImage postcard,welcome;

void setup()  {
  size (3000,1500);
  BG = loadImage("BG.PNG");
  //welcome = loadImage("WEL.PNG");
  //while (millis()<6000) {
  //  background(welcome);
  //}  
  background(BG);
  
  //loads cat images into array
  for (int i = 0; i <= 7; i++) {
      cats[i] = loadImage("cat"+i+".PNG");
   }
}

void draw() {
 // sets up the menu ui 
      fill(150);
      rect(0,0,50,2000);
      fill(201,0,130);
      rect(0,0,50,50);
      fill(244,147,205);
      rect(0,50,50,50);
      fill(171,38,170);
      rect(0,100,50,50);
      
// draws cat images into menu
      for (int i = 0; i <= 7; i++) {
          image(cats[i], 0, (150+(i*50)), 50, 50);
      fill(200, 97, 100);
      rect(0,550,50,50);
      fill(0);
      textSize(24);
      text("PEN", 2, 590);
      
// prints cursor position into terminal
      println (mouseX +"," + mouseY);
  }
  
}


void mouseClicked(){
 // if function to check which menu item was clicked     
    if (mouseX<50 & mouseY<50) {
      m=1;
      r=201;
      g=0;
      b=130;
      
    } else if (mouseX<50 & 50 < mouseY & mouseY < 100) {
      m=2;
      r=244;
      g=147;
      b=205;
     
    } else if (mouseX<50 & 100 < mouseY & mouseY < 150) {
      m=3;
      r=171;
      g=38;
      b=170;
      
    }else if (mouseX<50 & 150 < mouseY & mouseY < 200) {
      m=4;
    }else if (mouseX<50 & 200 < mouseY & mouseY < 250) {
      m=5;
    }else if (mouseX<50 & 250 < mouseY & mouseY < 300) {
      m=6;
    }else if (mouseX<50 & 300 < mouseY & mouseY < 350) {
      m=7;
    }else if (mouseX<50 & 350 < mouseY & mouseY < 400) {
      m=8;
    }else if (mouseX<50 & 400 < mouseY & mouseY < 450) {
      m=9;
    }else if (mouseX<50 & 450 < mouseY & mouseY < 500) {
      m=10;
    }else if (mouseX<50 & 500 < mouseY & mouseY < 550) {
      m=11;
    }
    
    if (mouseX<50 & 550 < mouseY & mouseY < 600) {
      m=12;
    }
    
    if (mouseX>50 & m>3 & m<12) {
       cat = new Catty();
    } 
 // grabs the pixels and saves an image if save button clicked     
    if (mouseX>2600 & mouseY>1330) {
       postcard = get(200,200,2850,1300);
       postcard.save("postcard"+k+".PNG");
       k++;
    }   
    }
    

// draws using the cubie type brushes
void mouseDragged(){
  if (m == 1 || m == 2 || m == 3){  
  cube1 = new Cubie();
  }
 //draws using the pen 
  if (m==12){
    strokeWeight(5);
    stroke(200, 97, 100);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
//class for cat image stamps
class Catty {
     
   Catty(){
    scale(0.2);
    image(cats[(m-4)], ((5*mouseX)-200), ((5*mouseY)-200));
   }
}


// class for cubie brush
class Cubie {
  
   Cubie() {
          float xpos = mouseX;
          float ypos = mouseY;
          
//creates and transforms different sides of the cubes to be drawn       
        pushMatrix();
          fill(color(0.6*r,0.6*g,0.6*b));
          translate(xpos, ypos+5);
          //rotateY(radians(40));
          shearY(radians(35));
          noStroke();
          rect(0, 0, 55, 45);
        popMatrix();
      
        pushMatrix();
          fill(color(.7*r,.7*g,.7*b));
          translate(xpos, ypos+5);
          //rotateX(radians(60));
          shearX(radians(30));
          noStroke();
          rect(0, 0, 50, 50);
        popMatrix();
        
        pushMatrix();
          fill(color(r,g,b));
          translate(xpos+30, ypos+30);
          noStroke();
          rect(0, 0, 50, 50);
        popMatrix();
  }
}