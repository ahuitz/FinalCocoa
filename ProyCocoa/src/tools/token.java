/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

/**
 *
 * @author Rosario
 */
public class token {
    private int fila;    
    private String cadena;
    private int entero;
    private float decimal;
    private String identificador;    
    private boolean tab;

    /**
     * constructor que convierte los numeros a enteros o flotantes
     * segun sea el caso
     * @param fila numero de fila en la que se encuentra dicho caracter
     * @param cadena texto leido en el analizador lexico
     * @param esEntero variable que recibe verdadero si es un numero entero, de lo contario se
     *                   asume que es un flotante/decimal
     * @param identificador alamacena si que tipo de token es "variable","reservada" etc
     */
    public token(int fila, String identificador, String cadena, boolean esEntero) {
        this.fila = fila;        
        this.identificador=identificador;
        this.cadena = cadena;                
        if(esEntero){
            this.entero = Integer.parseInt(cadena);
        }else{
            this.decimal = Float.parseFloat(cadena);
        }
    }   

    /**
     * constructor para almacenar las cadenas 
     * @param fila numero de fila en la que se encuentra el caracter almacenado
     * @param cadena texto encontrado por el analizador lexico
     */
    public token(int fila,String identificador, String cadena) {
        this.fila = fila;
        this.identificador=identificador;
        this.cadena = cadena;
    }
    /**
     * constructor para almacenar la informacion del tabulador
     * @param fila
     * @param identificador
     * @param tab
     * @param cadena 
     */
    public token(int fila,String identificador,boolean tab, String cadena) {
        this.fila = fila;
        this.identificador=identificador;
        this.cadena = cadena;
        this.tab=tab;        
    }
    
    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }
        
    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public String getCadena() {
        return cadena;
    }

    public void setCadena(String cadena) {
        this.cadena = cadena;
    }

    public int getEntero() {
        return entero;
    }

    public void setEntero(int entero) {
        this.entero = entero;
    }

    public float getDecimal() {
        return decimal;
    }

    public void setDecimal(float decimal) {
        this.decimal = decimal;
    }

    public boolean isTab() {
        return tab;
    }

    public void setTab(boolean tab) {
        this.tab = tab;
    }
    
    
 
 
}
