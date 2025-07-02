package Verificador;
public class VerifcadorEmail {
    public String Vry (){
        String VrySeg = VryCode();
        return VrySeg;
    }
    private String VryCode(){
        int keyNum[] = new int [3], keyPartN;
        char keyChar[] = new char [3],keyPartC;
        String keyComp = "";
        boolean keyVry = false;
        for (int i = 0; i < 3; i++){
            keyNum[i] = (int)(Math.random() * 9 + 1) - 1;
            keyChar[i] = (char)((int)(Math.random() * 26 + 1) - 1 + 65);
            if(i > 0)
                for(int j = 0; j < i; j++)
                    if((keyNum[j] == keyNum [i])||(keyChar[j] == keyChar[i])){
                        keyVry = true;
                        j = i;
                    }
            if(keyVry){
                i--;
                keyVry = false;
            }
        }
        for(int i = 0; i < 3; i++){
            keyPartN = keyNum[i];
            keyComp = keyComp + (Integer.toString(keyPartN));
        }
        for(int i = 0; i < 3; i++){
            keyPartC = keyChar[i];
            keyComp = keyComp + keyPartC;
        }
        return keyComp;
    }
}