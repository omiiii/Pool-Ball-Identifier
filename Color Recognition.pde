import processing.serial.*;   

PImage img;
String input = "";
int choice = 0;
int colornum = -48;
Serial port;

void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 19200); 
  img = loadImage("pool_svd2.jpg"); // Load the original image
  size(img.width, img.height);
  println("Please enter a color. 1 = red; 2 = blue; 3 = green; 4 = black; 5 = white");
  image(img, 0, 0); // Displays the image from point (0,0)
  loadPixels();
} 

void draw() {
}

void keyPressed() {
  colornum += int(key);
  switch(colornum) {
    case 1:
      for (int i=77;i<500;i+=101) {
        color c = img.get(i, 190);     
        double r = red(c);
        double g = green(c);
        double b = blue(c);
        choice++;
        
        if (r>g && r>b) {
          println(choice);          
          port.write(choice);
        }
      }
      break;
    case 2:
      for (int i=77;i<500;i+=101) {
        color c = img.get(i, 190);
        double r = red(c);
        double g = green(c);
        double b = blue(c); 
        choice++;
  
        if (b>r && b>g) {
          println(choice);
          port.write(choice);
        }
      }
      break;
  
    case 3:
      for (int i=77;i<500;i+=101) {
        color c = img.get(i, 190);
        double r = red(c);
        double g = green(c);
        double b = blue(c);
        choice++;
  
        if (g>r && g>b && g<100) {
          println(choice);
          port.write(choice);
        }
      }
      break;
  
    case 4:
      for (int i=77;i<500;i+=101) {
        color c = img.get(i, 190);
        double r = red(c);
        double g = green(c);
        double b = blue(c); 
        choice++;
        
        if (r<30 && b<30 && g<30) {
          println(choice);
          port.write(choice);
        }
      }
      break;
  
    case 5:
      for (int i=77;i<500;i+=101) {
        color c = img.get(i, 190);
        double r = red(c);
        double g = green(c);
        double b = blue(c); 
        choice++;
 
        if (r>90 && b>90 && g>90) { 
          println(choice);
          port.write(choice);
        }
      }
      break;
   }
   colornum = -48;
   loop();
}
