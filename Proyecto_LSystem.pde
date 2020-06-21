import queasycam.*;

// VALORES INICIALES CÁMARA //
float angulo_vision = -PI/2;
float distancia_visionado = 800;

// Posición Inicial
float posicionY = -300;
float posicionX = 0;

QueasyCam cam;
float angx = 0, angy, dang = TWO_PI/360;

// VALORES LSYSTEM
LSystem system;
int semilla;
int niveles = 11;
int vectorPesos[] = {14, 8, 6, 5, 5, 4, 4, 3, 2, 1, 0};

PShape uniones[] = new PShape[vectorPesos.length];
PShape suelo_box;

String default_rule = "F[+F]F[-F]";
int    default_iterations = 5;
float  default_angle = PI / 2;
float  default_angle_chaos = 0.5;
float  default_extension = 10;
float  default_extension_chaos = 0.5;
int iterations = default_iterations;

//Menu
Menu interfaz;
boolean dibujar = false;

// Texturas
PImage tronco_texture;
PImage uniones_texture;
PImage suelo_texture;

// Datos pantalla
PFont font;

// Captura de pantalla
String salida_fichero = "imagen.jpg";

void setup ()
{
  // Inicialización componentes visuales
  surface.setTitle("LSystem - Manuel Jesús Grávalos Cano - Francisco Jesús Beltrán Moreno");
  interfaz = new Menu(this);
  semilla = int( random( second() * minute() * hour() ) );
  size(1000, 800, P3D);
  cam = new QueasyCam(this);
  cam.sensitivity = 1;
  cam.speed = 0.1;
  cam.position.x = 400;
  cam.position.y = -800;
  cam.position.z = -1400;
  perspective(PI/3, (float)width/height, 0.2, 10000);

  frameRate(60);
  smooth();
  lights();
  
  interfaz.setVisible(true);
  font = createFont("Arial", 48);
  
  // LSystem
  system = new LSystem();
  system.iterate(iterations);

  // Texturas
  tronco_texture = loadImage("textures/tronco.jpg");
  uniones_texture = loadImage("textures/union.jpg");
  suelo_texture = loadImage("textures/suelo.jpg");
  
  // PShapes
  noStroke();

  for(int i = 0; i< vectorPesos.length; i++) {
   noStroke();
   uniones[i] = createShape(SPHERE, vectorPesos[i]);
   uniones[i].setTexture(uniones_texture);
  }
    
  suelo_box = createShape(BOX, 1000, 5, 1000);
  suelo_box.setTexture(suelo_texture);
}

//void mouseWheel(MouseEvent event) {
// float valor_rueda = event.getCount();
 
// if( valor_rueda > 0 ) distancia_visionado += 50;
//  else distancia_visionado -= 50;
//}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if ( keyPressed && key == 'x' ) cam.position.x += e*10;                     // [x] 
  if ( keyPressed && key == 'y' ) cam.position.y += e*10;                     // [y] 
  if ( keyPressed && key == 'z' ) cam.position.z += e*10;                     // [z] 
  if ( keyPressed && key == 'v' ) angx += e*dang;                          // [v]  
  if ( keyPressed && key == 'h' ) angy += e*dang;                          // [h]  
}


void draw() {

  if(dibujar){
   randomSeed(semilla);
   background(220,220,220);
   
   // Generación información en pantalla //
   pushMatrix();
   translate(700,-150, 600);
   textFont(font, 36);
   scale(-1,1);
   fill(0);
   text("Framerate: " + frameRate, 50, -850);
   text("Gramática seleccionada: " + interfaz.getLsystem(), 50, -800);
   text("Número de iteraciones: " + interfaz.getIteraciones(), 50, -750);
   text("Ángulo de expansión: " + interfaz.getAngulo(), 50, -700);
   text("Extensión de la rama: " + interfaz.getExtensionRama(), 50, -650);
   text("Entropía del ángulo de expansión: " + (float)interfaz.getAnguloChaos()/10, 50, -600);
   text("Entropía de la extensión de la rama: " + (float)interfaz.getExtensionChaos()/10, 50, -550);
   popMatrix();

   translate(0,5,0);
   shape(suelo_box);

   rotate(angx);
   rotate(angy);


   system.draw();
   if(keyPressed) {
      switch(key) {
         case 'c':
         case 'C':
           save(salida_fichero);
           break;
      }
    }
  }
}

void actualiza(int[] datos, String sistema, String doc) {
  dibujar = true;  
  system = new LSystem(datos, sistema);
  system.iterate(datos[0]);
  muestra_informacion_consola(datos, sistema);
  this.salida_fichero = doc;
}

int getWidth() {
 return this.width; 
}

int getHeigth() {
 return this.height; 
}

void muestra_informacion_consola(int[] datos, String sistema) {
  println("Gramática seleccionada: " + sistema);
  println("Número de iteraciones: " + datos[0]);
  println("Ángulo de expansión: " + datos[1]);
  println("Extensión de la rama: " + datos[2]);
  println("Entropía del ángulo de expansión: " + datos[3]);
  println("Entropía de la extensión de la rama: " + datos[4]);
  println("");
}
