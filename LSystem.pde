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

class LSystem
{
  String axiom, string, rule;
  String [] rules;
  float [] state;
  float [][] state_stack;
  int stack_size = 0;
  int pos = 0;
  
  float angle = default_angle;
  float angle_chaos = default_angle_chaos;
  float extension = default_extension;
  float extension_chaos = default_extension_chaos;
  
  LSystem () {
    axiom = "F";
    string = "F";
    rule = default_rule;
  }
  
  LSystem (int[] datos, String rule) {
    axiom = "F";
    string = "F";
    this.rule = rule;
    angle = datos[1] * PI / 180;
    extension = datos[2];
    
    angle_chaos = (float)datos[3] / 10;
    extension_chaos = (float)datos[4] / 10;
  }
  
  void iterate () { this.iterate(1); }
  
  void iterate (int count) {
    for (int i = 0; i < count; i++)
    {
      String string_next = "";
      
      for (int j = 0; j < string.length(); j++)
      {
        char c = string.charAt(j);
        if (c == 'F')
        {
          string_next = string_next + rule;
        } else {
          string_next = string_next + c;
        } 
      }
      string = string_next;
    } 
  }

  void draw() {    
    pos = 0;
    state = new float[4];
    state[0] = 0;
    state[1] = 0;
    state[2] = 0;
    state[3] = 0;
    rule = default_rule;
    state_stack = new float[4096][4];

    for (int i = 0; i < string.length(); i++) {
      this.drawSegment();
    }
  }
  
  void drawSegment () {
    if (pos >= string.length())
       { return; }
    
    char c = string.charAt(pos);
    switch (c) {
        case 'F':
          float ext_this = extension + random(-1.0 * extension * extension_chaos, extension * extension_chaos);
          float x_delta = ext_this * sin(state[2]);
          float y_delta = -ext_this * cos(state[2]);
          float z_delta = 0;

          // ANGULO BASE //
          if (stack_size == 0)
            z_delta = random(-5,5);
            else {
          if(state[3] == 0) // COMIENZO
            z_delta = ext_this * random(-0.75, 0.75);
          
          if(state[3] > 0) // SI TENDENCIA POSITIVA
            z_delta = ext_this * random(-0.25, 0.75);
            
          if(state[3] < 0) // SI TENDENCIA NEGATIVA
            z_delta = ext_this * random(-0.75, 0.75);
          }
          
          PVector inicio_rama = new PVector(state[0], state[1], state[3]);
          PVector fin_rama = new PVector(state[0] + x_delta, state[1] + y_delta, state[3] + z_delta);
          
          // SI TERMINAMOS UNA RAMA
          if( pos+1 <= string.length() && string.charAt(pos+1) == ']' )
            dibujaRama(inicio_rama, fin_rama, true, stack_size);
          else
            dibujaRama(inicio_rama, fin_rama, false, stack_size);

          state[0] += x_delta;
          state[1] += y_delta;
          state[3] += z_delta;
          
          break;
        case '-':
          state[2] -= (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
          break;
        case '+':
          state[2] += (angle + random(-1 * angle * angle_chaos, angle * angle_chaos));
          break;
        case '[':
          arraycopy(state, state_stack[stack_size++]);
          break;
        case ']':
          arraycopy(state_stack[--stack_size], state);
          break;
    }
    
    pos++;
  }
}
