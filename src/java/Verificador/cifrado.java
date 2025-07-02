package Verificador;
import java.security.*;
public class cifrado{
    public String MD5Transform(String Pass){
        String md5 = null;
        try {
            if (!Pass.equals("")) {
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.reset();
                md.update(Pass.getBytes());
                byte bytes[] = md.digest();
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < bytes.length; i++) {
                    String hex = Integer.toHexString(0xff & bytes[i]);
                    if (hex.length() == 1) {
                        sb.append('0');
                    }
                    sb.append(hex);
                }
                md5 = sb.toString();
            }
        } catch (NoSuchAlgorithmException e) {
            md5 = "Error inesperado";
        }
        return md5;
    }
}
        


 

    
