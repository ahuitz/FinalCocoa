/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Rosario
 */
public class main {
    
    public static void main(String[] args) {        
        try {
            Lexico lex = new Lexico(new FileReader("src/cocoarduino/prueba.txt"));
            Analizador parser = new Analizador(lex);
            parser.parse();            
        }catch (java.lang.Exception el){
            System.out.println("error encontrado" + el.getMessage());
        }
    }
    
}
