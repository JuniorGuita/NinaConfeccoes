package br.edu.fjn.progIII.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)  //informa��o gerada e armazenada pelo controlador em tempo de execu��o
@Target({ ElementType.METHOD, ElementType.TYPE })   // o alvo tanto em m�todo como em uma classe
public @interface Public {

}