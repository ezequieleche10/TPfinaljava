package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validaciones {
    public static boolean validaridUsuario(String text)  {       
        return procesoValidacion("^[0-9]{1,10}$", text);

    }

    public static boolean validarEmail(String text)   {
        return procesoValidacion("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$", text);

    }

    public static boolean validarPass(String text)   {
        return procesoValidacion("(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$", text); //(Entre 8 y 10 caracteres, por lo menos un digito y un alfanum�rico, y no puede contener caracteres espaciales)

    }

    public static boolean validarTelefono(String text)   {
       return  procesoValidacion("^[0-9]{3,14}$", text);

    }
    
    public static boolean validaridUsuario(int leg)  {
        String er = "^[0-9]{5}$";
        Pattern pattern = Pattern.compile(er);
        Matcher matcher = pattern.matcher(String.valueOf(leg));
        return matcher.matches();
    }
		

    public static boolean validarNombre(String nom) {
        return procesoValidacion("[A-Z][a-z A-Z]*$", nom);
    }
    
    

    public static boolean procesoValidacion(String patron, String texto){
        if(!texto.isEmpty()){
            Pattern pattern = Pattern.compile(patron);
            Matcher matcher = pattern.matcher(texto);
            return matcher.matches();
        }else{
            return false;
        }
    }
}

