package edu.berkeley.kaiju.frontend.request;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public class ClientPutAllRequestNew extends ClientRequest {
//    public Map<String, byte[]> keyValuePairs;

    public String keyValuePairs;

    ClientPutAllRequestNew() {}

    public ClientPutAllRequestNew(Map<String, byte[]> keyValuePairs) {
        try {
//        this.keyValuePairs = keyValuePairs;
            StringBuilder stringToSend = new StringBuilder();
            System.out.println("Building new string now");
            for (String keyString :
                    keyValuePairs.keySet()) {
                byte[] valueInPair = keyValuePairs.get(keyString);
                String valueString = new String(valueInPair, "UTF8");
                stringToSend.append(keyString + "[eok]" +
                        valueString + "[eov][sep]");
            }

            this.keyValuePairs = stringToSend.toString();
        } catch (UnsupportedEncodingException ex) {
            System.out.print("Encoding not supported");
        }
    }
}
