

class Menu {
  
  int    numero_iteraciones;
  float  anguloExpansion;
  float  anguloExpansion_chaos;
  float  extensionRama;
  float  extensionRama_chaos;
 
  public Menu() {
   
    // LECTURA DATOS
    
  }
  
  int get_Iteraciones() {
   return this.numero_iteraciones;
  }
  
  float get_angExpansion() {
   return this.anguloExpansion; 
  }
  
  float get_angExpansionCaos() {
    return this.anguloExpansion_chaos;
  }
  
  float get_extRama(){
    return this.extensionRama;
  }
  
  float get_extRamaCaos() {
    return this.extensionRama_chaos; 
  }
}
