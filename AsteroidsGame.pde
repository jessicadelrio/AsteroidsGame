//your variable declarations here

SpaceShip cool_ship;
Star [] superstar;
//Asteroids [] starburst;
ArrayList <Asteroids> starbursts;
ArrayList <Bullet> theBullets;
int collect;
int someTime = 0;
Bullet abullet;
//boolean touch = true;
public void setup() 
{
  //your code here
  size(500,500);
   cool_ship = new SpaceShip();
   //abullet = new Bullet(cool_ship);
  // starburst = new Asteroids[5];
   superstar = new Star[15];
   starbursts = new ArrayList <Asteroids>();
   theBullets = new ArrayList <Bullet>();
   //Asteroids someStarbursts = new Asteroids();
   
   for(int i = 0; i < superstar.length;i++){
    superstar[i] = new Star();
   }
   for(int i = 0; i < 10;i++){
    starbursts.add(new Asteroids());
    collect = 10;
   }
/*if(dist((float)starbursts.get(i).getDirectionX(),(float)starbursts.get(i).getDirectionY(),(float)cool_ship.getDirectionX(),(float)cool_ship.getDirectionY() ) < 20 ){
      starbursts.remove(i);
    }*/
   
   /*for(int i = 0; i < starburst.length; i++){
    starburst[i] = new Asteroids();
   }*/
 

}
public void draw() 
{
  background(255, 0, 128); 
  for(int i = 0; i < superstar.length; i++){
    superstar[i].shows();
  }

  

  cool_ship.move();
  cool_ship.show();

  for(int i = 0 ; i < starbursts.size() ; i++){
     starbursts.get(i).show();
     starbursts.get(i).move();

     //removes the starbursts
     if(dist((float)starbursts.get(i).getX(),
             (float)starbursts.get(i).getY(),
             (float)cool_ship.getX(),
             (float)cool_ship.getY() ) < 20){

      starbursts.remove(i);
      collect-=1;  
      }
      //removes bullets and makes them move
        for(int j = 0; j < theBullets.size();j++){
          theBullets.get(j).show();
          theBullets.get(j).move();
      if(dist((float)starbursts.get(i).getX(),
             (float)starbursts.get(i).getY(),
             (float)theBullets.get(j).getX(),
             (float)theBullets.get(j).getY())< 20){
            theBullets.remove(j);
            starbursts.remove(i);
            collect-=1;
            break;
          } 

          }
    }
    
    fill(0);
    text("Starbursts: "+collect,418,460);
   
   

  
  

  someTime++;
  //if()
  /*for(int i = 0 ; i < starbursts.size() ; i++){
     starburst[i].show();
     starburst[i].move();
  }*/
 text("Time: "+someTime,45,460);
 
 if(collect == 0){
      fill(0);
      text("YOU WON!",250,250);
         } 
  


}
public void keyPressed(){
  //rotate left and rotate right accelerate hyperspace
  if(key == 'w'){
    cool_ship.rotate(-10);
    cool_ship.accelerate(.1);
    
  }
  else if(key == 's'){
    cool_ship.rotate(10);
    cool_ship.accelerate(.1);
   

  }
  else if(key == 'a'){
    cool_ship.accelerate(.1);
    
  }
  else if(key == 'h'){
    cool_ship.hyperspace();
    cool_ship.accelerate(0);
  }else if(key == 'b'){
    theBullets.add(new Bullet(cool_ship));
    
    }
    

    
  }
  
class Star{
  int myX, myY,randcolor1,randcolor2,randcolor3;
  public Star(){
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    randcolor1 = (int)(Math.random()*401);
    randcolor2 = (int)(Math.random()*401);
    randcolor3 = (int)(Math.random()*401);
    }
    public void shows(){
      noStroke();
      fill(randcolor1,randcolor2,randcolor3);
      ellipse(myX,myY,20,20);
      ellipse(myX+15,myY,10,15+2);
      ellipse(myX-15,myY,10,15+2);

    }

}
class Asteroids extends Floater{
  protected int speedRotation;
  protected int myColor2, myColor3;
  Asteroids(){
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;
    yCorners[0] = 20;
    xCorners[1] = -20;
    yCorners[1] = -20;
    xCorners[2] = 20;
    yCorners[2] = -20;
    xCorners[3] = 20;
    yCorners[3] = 20;

    myCenterX = (int)(Math.random()*601);
    myCenterY = (int)(Math.random()*601);
    myDirectionX = (int)(Math.random()*11)-5;
    myDirectionY = (int)(Math.random()*11)-5;
    myColor = color(255,255,0);
    myPointDirection = 0;
    speedRotation = (int)(Math.random()*11)-5;
  }
   public void setX(int x){
      myCenterX = x;
    }public int getX(){
      return (int)myCenterX;
    }public void setY(int y){
      myCenterY = y;
    }public int getY(){
      return (int)myCenterY;
    }public void setDirectionX(double x){
      myDirectionX = x;
    }
    public double getDirectionX(){
      return myDirectionX;
    } 
    public void setDirectionY(double y){
      myDirectionY = y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection = degrees;
    }
    public double getPointDirection(){
      return myPointDirection;

    } public void move(){
      //gets from the super class its move function 
      super.move();
      //it gets the rotate function and then you input in the speed rotation
      rotate(speedRotation);
    }

}
class SpaceShip extends Floater  
{   
    //your code here
    //int randnumber;
    public SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -10;
      yCorners[0] = -10;
      xCorners[1] = 20;
      yCorners[1] = 0;
      xCorners[2] = -10;
      yCorners[2] = 10;
      xCorners[3] = -4;
      yCorners[3] = 0;

      myColor = 0;

      myCenterX = -4+100;
      myCenterY = 0+100;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      //randnumber = (int)(Math.random()*400);
}
    public void setX(int x){
      myCenterX = x;
    }public int getX(){
      return (int)myCenterX;
    }public void setY(int y){
      myCenterY = y;
    }public int getY(){
      return (int)myCenterY;
    }public void setDirectionX(double x){
      myDirectionX = x;
    }
    public double getDirectionX(){
      return myDirectionX;
    } 
    public void setDirectionY(double y){
      myDirectionY = y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection = degrees;
    }
    public double getPointDirection(){
      return myPointDirection;

    }
    public void hyperspace(){
      int randnumber = (int)(Math.random()*400);
      myCenterX = randnumber;
      myCenterY = randnumber;
      myDirectionX = 0;
      myDirectionY = 0;
    }
}class Bullet extends Floater{
  private double dRadians; 
  public Bullet(SpaceShip theShip){
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians)+theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians)+theShip.getDirectionY();
  }
    public void setX(int x){
      myCenterX = x;
    }public int getX(){
      return (int)myCenterX;
    }public void setY(int y){
      myCenterY = y;
    }public int getY(){
      return (int)myCenterY;
    }public void setDirectionX(double x){
      myDirectionX = x;
    }
    public double getDirectionX(){
      return myDirectionX;
    } 
    public void setDirectionY(double y){
      myDirectionY = y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection = degrees;
    }
    public double getPointDirection(){
      return myPointDirection;

    }
  public void show(){
    fill(0,0,244);
    ellipse((float)myCenterX+10,(float)myCenterY+2,15,5);
    

  }
    public void move(){
      super.move();

    }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

