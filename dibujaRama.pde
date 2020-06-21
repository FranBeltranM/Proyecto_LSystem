// https://stackoverflow.com/questions/16129537/how-to-animate-a-3d-curve-between-two-points-on-a-map
void dibujaRama(PVector inicio, PVector fin, boolean finalRama, boolean generadoTronco, int nivel) {
  PVector vector_unitario = new PVector(fin.x - inicio.x, fin.y - inicio.y, fin.z - inicio.z);
  
  float rho = sqrt(pow(vector_unitario.x,2) + pow(vector_unitario.y,2) + pow(vector_unitario.z,2));
  float phi = acos(vector_unitario.z/rho);
  float theta = atan2(vector_unitario.y, vector_unitario.x);
  
  vector_unitario.mult(0.5);
  
  pushMatrix();
  translate(inicio.x, inicio.y, inicio.z);
  shape(uniones[nivel]);
  translate(vector_unitario.x, vector_unitario.y, vector_unitario.z);
  
  rotateZ(theta);
  rotateY(phi);
  
  noStroke();
  
  if(finalRama)
   drawCylinder( 20, random(4), vectorPesos[nivel], inicio.dist(fin));
  else
   if(!generadoTronco)
     drawCylinder( 20, vectorPesos[nivel], vectorPesos[nivel]+1, inicio.dist(fin));
   else
     drawCylinder( 10, vectorPesos[nivel], 20, inicio.dist(fin));

  popMatrix();
}

// https://vormplus.be/full-articles/drawing-a-cylinder-with-processing
void drawCylinder(int sides, float r1, float r2, float h)
{
    textureMode(IMAGE);
    float angle = 360 / sides;
    float halfHeight = h / 2;
    
    // top
    noStroke();
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        texture(tronco_texture);
        vertex( x, -y, halfHeight, i*25, 0);
    }
    endShape(CLOSE);
    
    // bottom
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        texture(tronco_texture);
        vertex( x, -y, -halfHeight, i*25, 100);
    }
    endShape(CLOSE);
    
    // draw body
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        texture(tronco_texture);
        vertex( x1, -y1, halfHeight, i*25, 0);
        vertex( x2, -y2, -halfHeight, i*25, 100);
    }
    endShape(CLOSE);
}
