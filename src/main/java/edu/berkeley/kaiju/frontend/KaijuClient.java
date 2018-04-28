package edu.berkeley.kaiju.frontend;

import com.esotericsoftware.kryo.KryoException;
import edu.berkeley.kaiju.config.Config;
import edu.berkeley.kaiju.exception.ClientException;
import edu.berkeley.kaiju.exception.KaijuException;
import edu.berkeley.kaiju.frontend.request.ClientGetAllRequest;
import edu.berkeley.kaiju.frontend.request.ClientPutAllRequest;
import edu.berkeley.kaiju.frontend.request.ClientPutAllRequestNew;
import edu.berkeley.kaiju.frontend.request.ClientSetIsolationRequest;
import edu.berkeley.kaiju.frontend.response.ClientError;
import edu.berkeley.kaiju.frontend.response.ClientGetAllResponse;
import edu.berkeley.kaiju.util.KryoSerializer;

import java.io.*;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 Client-side interface for interacting with Kaiju cluster.
 Clients can connect to *any* server in the cluster (like Dynamo/Cassandra).
 */
public class KaijuClient {

    private class HostInfo{
        String hostIp;
        String port;

        public HostInfo(String hostIpAddr, int portNum) {
            this.hostIp = hostIpAddr;
            this.port = Integer.toString(portNum);
        }

//        public String getHostInfo() {
//            return (hostIp + ":" + port);
//        }

        public String getHostInfo() {
            return hostIp;
        }
    }

    private Socket clientSocket;
    private boolean hasClosed = false;
    private KryoSerializer serializer = new KryoSerializer();
    private Map<String, HostInfo> keyMappings = new HashMap<String, HostInfo>();
    public KaijuClient(String host, int port) throws IOException {
        Config.clientSideInitialize();
        System.out.println("Created one socket " + host + " " + port);

        this.currentHost = new HostInfo(host, port);

        clientSocket = new Socket(host, port);
        serializer.setInputStream(clientSocket.getInputStream());
        serializer.setOutputStream(clientSocket.getOutputStream());
    }

    private HostInfo currentHost;

    public void close() throws IOException {
        hasClosed = true;
        System.out.println("Writing key mappings to file");
        try {
            BufferedWriter writer = new BufferedWriter(
                    new FileWriter("keyMappings.txt", true));

            for (String keyString :
                    keyMappings.keySet()) {
                writer.append(keyString + ',' + keyMappings.get(keyString).getHostInfo());
                writer.append("\n");
            }
            writer.close();

        } catch (Exception ex) {
            System.out.println("SOMETHING IS WRONG, exception when closing socket in kaiju client");
        }
//        serializer.serialize("[exit]");
        System.out.println("Closing kaiju socket");
//        BufferedReader reader = new BufferedReader(
//                new InputStreamReader(clientSocket.getInputStream()));
//        StringBuilder out = new StringBuilder();
//        String line;
//        while((line = reader.readLine()) != null) {
//            out.append(line);
//        }
//
//        System.out.println(out.toString());
//        reader.close();
        try {
            while (true) {
                Thread.sleep(30000);
            }
        } catch (InterruptedException e) {
            System.out.println("Interrupted waiting before closing socket");
        }
        // clientSocket.close();
    }

    public Map<String, byte[]> get_all(List<String> keys) throws IOException, KaijuException {
        try {
//            System.out.println("Should not have happened");
            StringBuilder stringToSend = new StringBuilder("[beg]");
            System.out.println("READ operation");
            for (String keyString :
                    keys) {
                stringToSend.append(keyString + "[eor]");
            }

            stringToSend.append("[sep]");

//            System.out.println(stringToSend.toString());
            String stringBuilderConvertTemp = stringToSend.toString().replace("\"", "$");
            String stringBuilderConvertTempTrimmed = stringBuilderConvertTemp.trim();
            String stringBuilderConvert = stringBuilderConvertTempTrimmed.replaceAll("\\s+", "\\$");
            System.out.println(stringBuilderConvert);
            serializer.serialize(stringBuilderConvert);
//            Thread.sleep(3000);
//            Object ret = serializer.getObject();
//            serializer.serialize(new ClientGetAllRequest(keys));
//            Object ret = serializer.getObject();
//            if (ret instanceof ClientError    ) {
//                throw new ClientException(((ClientError) ret).error);
//            }

//            return ((ClientGetAllResponse) ret).keyValuePairs;
            java.util.Map<String, byte[]> temp = new HashMap<String, byte[]>();
            temp.put("dummy", null);
            return temp;
        } catch (KryoException e) {
            System.out.println("[EXCEPTION] Something went wrong with read transaction");
            if(!hasClosed) {
//                throw e;
            }
        } catch (Exception e) {
            System.out.println("[EXCEPTIOn] Issue when waiting");
        }

        return null;
    }


    public void put_all(Map<String, byte[]> keyValuePairs) throws IOException, KaijuException {
        try {
            StringBuilder stringToSend = new StringBuilder("[beg]");
            System.out.println("Write operation");
            for (String keyString :
                    keyValuePairs.keySet()) {
                keyMappings.put(keyString, currentHost);
                byte[] valueInPair = keyValuePairs.get(keyString);
                String valueString = new String(valueInPair, "UTF8");
                stringToSend.append(keyString + "[eok]" +
                    valueString + "[eov]");
                System.out.println("Key is " + keyString);
            }

            stringToSend.append("[sep]");
//            System.out.println(stringToSend.toString());
            String stringBuilderConvertTemp = stringToSend.toString().replace("\"", "$");
            String stringBuilderConvertTempTrimmed = stringBuilderConvertTemp.trim();
            String stringBuilderConvert = stringBuilderConvertTempTrimmed.replaceAll("\\s+", "\\$");
            System.out.println(stringBuilderConvert);
            serializer.serialize(stringBuilderConvert);
//            Thread.sleep(3000);
//            Object ret = serializer.getObject();
//            serializer.serialize(new ClientPutAllRequest(keyValuePairs));
//            serializer.serialize(new ClientPutAllRequestNew(keyValuePairs));
//            Object ret = serializer.getObject();
//            if (ret instanceof ClientError) {
//                throw new ClientException(((ClientError) ret).error);
//            }
        } catch (KryoException e) {
            System.out.println("[EXCEPTION] Something went wrong with write transaction");
            if(!hasClosed) {
//                throw e;
            }
        } catch (Exception e) {
            System.out.println("[EXCEPTIOn] Issue when waiting");
        }
    }

    public void setIsolation(Config.IsolationLevel level, Config.ReadAtomicAlgorithm algorithm, boolean postLoad) throws IOException, KaijuException {
//        serializer.serialize(new ClientSetIsolationRequest(level, algorithm));
//        Object ret = serializer.getObject();
//        if (ret instanceof ClientError) {
//            throw new ClientException(((ClientError) ret).error);
//        }
        try {
            if (postLoad) {
                String line = null;
                StringBuilder keyMappingString = new StringBuilder("[beg]");
                FileReader key_mappings_file = new FileReader("keyMappings.txt");
                BufferedReader bufferedReader = new BufferedReader(key_mappings_file);
                while ((line = bufferedReader.readLine()) != null) {
                    String[] keyAndHost = line.split(",");
                    keyMappingString.append(keyAndHost[0] + "[eok]" +
                            keyAndHost[1] + "[eoa]");
                }

                keyMappingString.append("[sep]");
                System.out.println("setIsolation: " + keyMappingString);
                serializer.serialize(keyMappingString.toString());
                Thread.sleep(3000);
//                Object ret = serializer.getObject();
            }
        } catch (KryoException e) {
            System.out.println("[EXCEPTION] Something went wrong with sending key-host mapping");
            if(!hasClosed) {
//                throw e;
            }
        } catch (Exception e) {
            System.out.println("[EXCEPTIOn] Issue when waiting " + e.toString());
        }
    }

    public void setIsolation(Config.IsolationLevel level) throws IOException, KaijuException {
        setIsolation(level, Config.ReadAtomicAlgorithm.KEY_LIST, false);
    }
}
