package br.edu.fjn.progIII.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)  //informação gerada e armazenada pelo controlador em tempo de execução
@Target({ ElementType.METHOD, ElementType.TYPE })   // o alvo tanto em método como em uma classe
public @interface Public {

}