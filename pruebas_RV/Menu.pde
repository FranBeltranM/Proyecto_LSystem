

class Menu extends javax.swing.JFrame {
  
  int    numero_iteraciones;
  float  anguloExpansion;
  float  anguloExpansion_chaos;
  float  extensionRama;
  float  extensionRama_chaos;
 
  public Menu() {
   
    // LECTURA DATOS
    initComponents();
    
  }
 /* public float[] getDatos(){
    return [(float)get_Iteraciones(), get_angExpansion(), get_angExpansionCaos(), get_extRama(), get_extRamaCaos()]
  }*/
  
  int get_Iteraciones() {
   //return it.getText();
   return 0;
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
  private void initComponents() {

        it = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        ang = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        leng = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);


        jLabel1.setText("Numero iteraciones");

        jLabel2.setText("Ángulo de expansión");

        leng.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                //lengKeyTyped(evt);
            }
        });

        jLabel3.setText("Extensión de las ramas");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(170, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(leng, javax.swing.GroupLayout.DEFAULT_SIZE, 185, Short.MAX_VALUE)
                    .addComponent(ang)
                    .addComponent(it))
                .addGap(128, 128, 128))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(it, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(leng, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addContainerGap(224, Short.MAX_VALUE))
        );

        pack();
    }
    private javax.swing.JTextField ang;
    private javax.swing.JTextField it;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JTextField leng;
}
