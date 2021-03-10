  
/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */

%class SimplesLexer
%line
%column
%cup
   

%{   
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   
digit           = [0-9]  
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
integer   =   {digit}+
float = {integer}\.{integer}
identifier = [A-Za-z_][A-Za-z_0-9]*     

commentinicio   = \/\*
commentfim      = \*\/
naocommentfim   = [^\*\/]
commentbody     = {naocommentfim}*
comment =  {commentinicio}{commentbody}{commentfim} | \/\/[a-zA-Z0-9 \t]*  

%%
/* ------------------------Lexical Rules Section---------------------- */

   
<YYINITIAL> {

   
    ";"                {  return symbol(sym.SEMI);     }
    "+"                {  return symbol(sym.PLUS);     }
    "-"                {  return symbol(sym.MINUS);    }
    "*"                {  return symbol(sym.TIMES);    }
    "div"              {  return symbol(sym.DIVIDE);   }
    "("                {  return symbol(sym.LPAREN);   }
    ")"                {  return symbol(sym.RPAREN);   }
    "["                {  return symbol(sym.LBRCKT);   }
    "]"                {  return symbol(sym.RBRCKT);   }
    "<-"               {  return symbol(sym.ATTRIB);   }
    "="                {  return symbol(sym.EQUALS);   }
    ">"                {  return symbol(sym.GREATER);  }
    "<"                {  return symbol(sym.LESS);     }
    "escreva"          {  return symbol(sym.WRITELINE);}
    "leia"             {  return symbol(sym.READLINE); }
    "programa"         {  return symbol(sym.PROGRAM);  }
    "inicio"           {  return symbol(sym.STARTPRG); }
    "fim"              {  return symbol(sym.ENDPRG);   }
    "inteiro"          {  return symbol(sym.DECLINT);  }
    "flutuante"        {  return symbol(sym.DECLFLOAT);}
    "se"               {  return symbol(sym.IFF);      }
    "entao"            {  return symbol(sym.THENN);    }
    "senao"            {  return symbol(sym.ELSEE);    }
    "fimse"            {  return symbol(sym.ENDELSE);  }
    "nao"              {  return symbol(sym.NAO);       }
    "para"             {  return symbol(sym.PARA);     }
    "de"               {  return symbol(sym.DE);       }
    "ate"              {  return symbol(sym.ATE);      }
    "passo"            {  return symbol(sym.PASSO);    }
    "faca"             {  return symbol(sym.FACA);     }
    "fimpara"          {  return symbol(sym.FIMPARA);  }
    "enquanto"         {  return symbol(sym.ENQUANTO); }
    "fimenquanto"      {  return symbol(sym.FIMENQUANTO);}
    "e"                {  return symbol(sym.E);        }
    "ou"               {  return symbol(sym.OU);       }
 
    {integer}      { return symbol(sym.INTT,yytext()); }
    {float}    { return symbol(sym.FLOATT, yytext()); }
    {identifier}       { return symbol(sym.ID, yytext());} 
    {WhiteSpace}       { /* just skip what was found, do nothing */ }   
    {comment}          { /* just skip what was found, do nothing */ }   
}

[^]                    { System.err.println("Error: Caracter Ilegal <"+yytext()+"> na linha: " + yyline); }
