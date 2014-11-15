package tools;
import java_cup.runtime.Symbol;
%%
%class Lexico
%line
%cup

//comilla= ["a-zA-Z"]
Tabulator = [\t] | [ ]{4}
entero= [0-9]
exponente=["x10""X10"eE]
flotante={entero}[\.]{entero}+{exponente}[0-9]+
variables=[a-zA-Z]+[0-9]*
//Espacio=[ \t\r\n]
and=[a][n][d]|[A][N][D]
or=[o][r]|[O][R]
entradaC = [^\r\n]
finL = \r|\n|\r\n
comentarioA = "/*" [^*] ~"*/" | "/*" "*"+ "/"
comentarioB = "//" {entradaC}*{finL}?
nomClase = [A-Z]+{variables}
comillas="\"" {entradaC}*{finL}? "\""
lineaTerminal = [\r|\n|\r|\n]
espacioBlanco = {lineaTerminal}|[ \t\f]
//finlinea = [\n^]
%eofval{
  System.out.println("Fin de archivo encontrado");
  return new Symbol(sym.EOF);
%eofval}
%eofclose


%%   
  
    "clase" {return new Symbol(sym.CLASE, new token(yyline,"RESERVADA", yytext()));}    
    {nomClase} {return new Symbol(sym.NOMCLASE, new token(yyline,"ID", yytext()));}



//{finlinea} {return new Symbol(sym.INDENT, new token(yyline,"INDENT", yytext()));}
"propiedades" {return new Symbol(sym.PROPIEDADES, new token(yyline,"RESERVADA", yytext()));} 



    /*RESERVADAS PARA METODOS*/
        "boleano" {return new Symbol(sym.BOLEANO, new token(yyline,"RESERVADA", yytext()));}
        "cadena" {return new Symbol(sym.CADENA, new token(yyline,"RESERVADA", yytext()));}
        "entero" {return new Symbol(sym.ENTERO, new token(yyline,"RESERVADA", yytext()));}
        "decimal" {return new Symbol(sym.DECIMAL, new token(yyline,"RESERVADA", yytext()));}
        "metodos" {return new Symbol(sym.METODOS, new token(yyline,"RESERVADA", yytext()));}   

{flotante}      {return new Symbol(sym.NUMERO, new token(yyline,"NUMERO", yytext()));}
{entero}+       {return new Symbol(sym.NUMERO, new token(yyline,"NUMERO", yytext()));}

/*Palabras Reservadas*/
{and}           {return new Symbol(sym.AND, new token(yyline,"RESERVADA", yytext()));}
"desde"         {return new Symbol(sym.DESDE, new token(yyline,"RESERVADA", yytext()));}
"devolver"      {return new Symbol(sym.DEVOLVER, new token(yyline,"RESERVADA", yytext()));}
"entonces"      {return new Symbol(sym.ENTONCES, new token(yyline,"RESERVADA", yytext()));}
"escribir"      {return new Symbol(sym.ESCRIBIR, new token(yyline,"RESERVADA", yytext()));}
"extiende"      {return new Symbol(sym.EXTIENDE, new token(yyline,"RESERVADA", yytext()));}
"falso"         {return new Symbol(sym.FALSO, new token(yyline,"RESERVADA", yytext()));}
"hacer"         {return new Symbol(sym.HACER, new token(yyline,"RESERVADA", yytext()));}
"incrementar"   {return new Symbol(sym.INCREMENTAR, new token(yyline,"RESERVADA", yytext()));}
"leer"          {return new Symbol(sym.LEER, new token(yyline,"RESERVADA", yytext()));}
"mientras"      {return new Symbol(sym.MIENTRAS, new token(yyline,"RESERVADA", yytext()));}
"NULO"|"nulo"   {return new Symbol(sym.NULO, new token(yyline,"RESERVADA", yytext()));}
"sino"          {return new Symbol(sym.SINO, new token(yyline,"RESERVADA", yytext()));}
"si"            {return new Symbol(sym.SI, new token(yyline,"RESERVADA", yytext()));}
"retornar"      {return new Symbol(sym.RETORNAR, new token(yyline,"RESERVADA", yytext()));}
{or}            {return new Symbol(sym.OR, new token(yyline,"RESERVADA", yytext()));}
"verdadero"     {return new Symbol(sym.VERDADERO, new token(yyline,"RESERVADA", yytext()));}


/*IDENTIFICADORES*/
{variables}+       {return new Symbol(sym.VARIABLE, new token(yyline,"ID",yytext()));}

/*OPERADORES*/
"++"            {return new Symbol(sym.MMAS, new token(yyline,"OPERADOR", yytext()));}
"+"             {return new Symbol(sym.SUMA, new token(yyline,"OPERADOR", yytext()));}
"--"            {return new Symbol(sym.MMENOS, new token(yyline,"OPERADOR", yytext()));}
"-"             {return new Symbol(sym.RESTA, new token(yyline,"OPERADOR", yytext()));}
"*"             {return new Symbol(sym.MULTIPLICACION, new token(yyline,"OPERADOR", yytext()));}
"%"             {return new Symbol(sym.MODULO, new token(yyline,"OPERADOR", yytext()));}
"=="            {return new Symbol(sym.IIGUAL, new token(yyline,"OPERADOR", yytext()));}
"="             {return new Symbol(sym.IGUAL, new token(yyline,"OPERADOR", yytext()));}
"/"             {return new Symbol(sym.DIAGONAL, new token(yyline,"OPERADOR", yytext()));}
">"             {return new Symbol(sym.MAYORQUE, new token(yyline,"OPERADOR", yytext()));}
"<"             {return new Symbol(sym.MENORQUE, new token(yyline,"OPERADOR", yytext()));}
"!="            {return new Symbol(sym.DIFERENCIA, new token(yyline,"OPERADOR", yytext()));}
"|"             {return new Symbol(sym.OPCION, new token(yyline,"OPERADOR", yytext()));}

/*ESPECIALES*/
";"             {return new Symbol(sym.PCOMA, new token(yyline,"ESPECIALES", yytext()));}
"."             {return new Symbol(sym.PUNTO, new token(yyline,"ESPECIALES", yytext()));}
"("             {return new Symbol(sym.PA, new token(yyline,"ESPECIALES", yytext()));}
")"             {return new Symbol(sym.PC, new token(yyline,"ESPECIALES", yytext()));}
","             {return new Symbol(sym.COMA, new token(yyline,"ESPECIALES", yytext()));}
"["             {return new Symbol(sym.CA, new token(yyline,"ESPECIALES", yytext()));}
"]"             {return new Symbol(sym.CC, new token(yyline,"ESPECIALES", yytext()));}

/*COMENTARIOS*/
({comentarioB})+ {/*ignore*/}
({comentarioA})+ {/*ignore*/}
{espacioBlanco} {/*ignore*/}
/*ESPACIOS*/
 //   ("  ") {return new Symbol(sym.DOSESPACIOS, new token(yyline,"DOSESPACIOS", yytext())); }
 //   (" ") {return new Symbol(sym.UNESPACIO, new token(yyline,"UNESPACIO", yytext())); }
{lineaTerminal} {return new Symbol(sym.FNLINEA, new token(yyline,"FNLINEA",yytext())); }
/*COMILLAS*/
({comillas})+ {return new Symbol(sym.CADENAS, new token(yyline,"CADENAS", yytext()));}
    
{Tabulator} {return new Symbol(sym.TAB, new token(yyline, "TAB", yytext(), true)); }

/*FIN DE LINEA*/

[ \r\n\f] { }
. {yyclose(); 
    System.err.println("Caracter Invalido" + yytext() + "["+ yyline + "]");
    return new Symbol(sym.ERROR);}