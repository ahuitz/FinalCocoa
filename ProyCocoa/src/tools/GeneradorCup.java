/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rosario
 */
public class GeneradorCup {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String opciones[] = new String[5];
        opciones[0]="-destdir";
        opciones[1]="src"+File.separator+"tools";        
        opciones[2]="-parser";
        opciones[3]="Analizador";
        opciones[4]="src"+File.separator+"tools"+File.separator+"ASintactico.cup";                
        
        try {
            java_cup.Main.main(opciones);
        } catch (IOException ex) {
            Logger.getLogger(GeneradorCup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GeneradorCup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
