/*

    Implementation of Lindenmayer Systems:
    emulates plant growth via a simple formal grammar.

    Copyright (c) Daniel Jones 2007.
    http://www.erase.net/
   
    ----------------------------------------------------------------------

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/
import javax.swing.JOptionPane;
 
 
String default_rule = "F[+F]F[-F]";

int    numero_iteraciones = 5;
float  anguloExpansion = PI / 10;
float  anguloExpansion_chaos = 0.5;
float  extensionRama = 10;
float  extensionRama_chaos = 0.5;

int     yInicio = 400;
boolean default_draw_tips = true;

String  default_filename = "iterations-0.pdf";

int anc;
int alt;

LSystem system;

void lectura() {
  String anchura = JOptionPane.showInputDialog(frame, "Introduzca la anchura de la ventana: ");
  String altura = JOptionPane.showInputDialog(frame, "Introduzca la altura de al ventana: ");
  
  anc = parseInt(anchura);
  alt = parseInt(altura);

}

void setup ()
{
  int iterations = numero_iteraciones;

  size(800, 600);
  background(250);
  frameRate(60);
  smooth();
  system = new LSystem();
  system.iterate(iterations);
  
  //system.draw();
}

void draw ()
{
  // To draw segment by segment, rename this routine to draw()
  // and remove system.draw() from setup().
  translate(100, yInicio);
  rotate(1.5 * PI);

  //system.draw();
  for (int i = 0; i < random(10, 50); i++)
  {
    system.drawSegment();
  }
}
