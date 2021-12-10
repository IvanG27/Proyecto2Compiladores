%{
    #include <iostream>
    #include <string>
    using namespace std;
    #include "tokens.h"
    #include "Scanner.h"

%}

%option c++
%option outfile="Scanner.cpp" 
%option yyclass="C::Scanner" 
%option case-insensitive
%option noyywrap

ENTERO [0-9]+
FLOTANTE ([0-9])*.([0-9])+([Ee]([+-])?([0-9])+)?[f]
DOBLE ([0-9])*.([0-9])+([Ee]([+-])?([0-9])+)?

ID [A-Za-z_][A-Za-z0-9_]*
CADENA ["]([a-zA-Z0-9 \t\n\r!#%&'*+-/:;<>=?,])*["]
CARACTER [']([a-zA-Z0-9 \t\n\r!#%&'*+-/:;<>=?,])[']

ESP [ \t\n\r]

%%

"int" {return INT;}
"float" {return FLOAT;}
"else" {return ELSE;}
"if" {return IF;}
"while" {return WHILE;}
"+" {return MAS;}
"-" {return MENOS;}
"*" {return MUL;}
"/" {return DIV;}
"=" {return ASIG;}
"(" {return LPAR;}
")" {return RPAR;}
";" {return PYC;}
"," {return COMA;}
"{" {return LKEY;}
"}" {return RKEY;}
"char" {return CHAR;}
"double" {return DOUBLE;}
"struct" {return STRUCT;}
"void" {return VOID;}
"do" {return DO;}
"print" {return PRINT;}
"." {return PUNTO;}
"scan"  {return SCAN;}
"break" {return BREAK;}
"return" {return RETURN;}
"|" {return OR;}
"&" {return AND;}
">" {return MAYOR;}
"<" {return MENOR;}
"!" {return DIF;}
{ID} {return ID;}
{ESP} {}
{ENTERO} {return NUMERO;}
{FLOTANTE} {return NUMERO;}
{DOBLE} {return NUMERO;}
{CADENA} {return CADENA;}
{CARACTER} {return CARACTER;}
. {cout<<"ERROR LÉXICO " <<yytext<<endl;}

%%
