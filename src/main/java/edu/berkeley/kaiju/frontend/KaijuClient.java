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

import java.io.IOException;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Map;

/*
 Client-side interface for interacting with Kaiju cluster.
 Clients can connect to *any* server in the cluster (like Dynamo/Cassandra).
 */
public class KaijuClient {
    private Socket clientSocket;
    private boolean hasClosed = false;
    private KryoSerializer serializer = new KryoSerializer();

    public KaijuClient(String host, int port) throws IOException {
        Config.clientSideInitialize();
        System.out.println("Created one socket " + host + " " + port);
        clientSocket = new Socket(host, port);
        serializer.setInputStream(clientSocket.getInputStream());
        serializer.setOutputStream(clientSocket.getOutputStream());
    }

    public void close() throws IOException {
        hasClosed = true;
//        serializer.serialize("EXIT");
        clientSocket.close();
    }

    public Map<String, byte[]> get_all(List<String> keys) throws IOException, KaijuException {
        try {
            System.out.println("Should not have happened");
            serializer.serialize(new ClientGetAllRequest(keys));
            Object ret = serializer.getObject();
            if (ret instanceof ClientError) {
                throw new ClientException(((ClientError) ret).error);
            }

            return ((ClientGetAllResponse) ret).keyValuePairs;
        } catch (KryoException e) {
            if(!hasClosed) {
                throw e;
            }

            return null;
        }
    }


    public void put_all(Map<String, byte[]> keyValuePairs) throws IOException, KaijuException {
        try {
            StringBuilder stringToSend = new StringBuilder("[beg]");
            System.out.println("Building new string now1");
            for (String keyString :
                    keyValuePairs.keySet()) {
                byte[] valueInPair = keyValuePairs.get(keyString);
                String valueString = new String(valueInPair, "UTF8");
                stringToSend.append(keyString + "[eok]" +
                    valueString + "[eov][sep]");
            }

            System.out.println(stringToSend.toString());
            String stringBuilderConvert = stringToSend.toString().replace("\"", "$");
            System.out.println(stringBuilderConvert);
            serializer.serialize(stringBuilderConvert);

//            serializer.serialize(new ClientPutAllRequest(keyValuePairs));
//            serializer.serialize(new ClientPutAllRequestNew(keyValuePairs));
//            Object ret = serializer.getObject();
//            if (ret instanceof ClientError) {
//                throw new ClientException(((ClientError) ret).error);
//            }
        } catch (KryoException e) {
            if(!hasClosed) {
                throw e;
            }
        }
    }

    public void setIsolation(Config.IsolationLevel level, Config.ReadAtomicAlgorithm algorithm) throws IOException, KaijuException {
//        serializer.serialize(new ClientSetIsolationRequest(level, algorithm));
//        Object ret = serializer.getObject();
//        if (ret instanceof ClientError) {
//            throw new ClientException(((ClientError) ret).error);
//        }
    }

    public void setIsolation(Config.IsolationLevel level) throws IOException, KaijuException {
        setIsolation(level, Config.ReadAtomicAlgorithm.KEY_LIST);
    }
}
