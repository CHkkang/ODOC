package cap.stone.design.service;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Server {
   private static String serverIP;
   private static int serverPort;
   private static List <String> tfdata = new ArrayList<String>();
   
   public Server(String ip, int port) {
	   this.serverIP = ip;
	   this.serverPort = port;
   }
   static public void run(List <String> transferData) throws InterruptedException {
      DataOutputStream dos = null;
      DataInputStream dis = null;
      try (Socket socket = new Socket(serverIP, serverPort)) {
    	  
   	    System.out.println("������ʹ� server�� �Ѿ�°�");
   	       for(int i=0;i<transferData.size();i++) {
   	           System.out.println(transferData.get(i));
   	    }
   	    
         // ��½�Ʈ��
         OutputStream out = socket.getOutputStream();
         dos = new DataOutputStream(out);
         InputStream in = socket.getInputStream();
         dis = new DataInputStream(in);
         File file = null;
         FileOutputStream fos = null;
         BufferedOutputStream bos = null;

         String str = "start";
         // byte[] buf = new byte[1024];
         byte[] buf = str.getBytes();

         dos.write(buf);
         dos.flush();
 	     for(int j=0;j<transferData.size();j++) {
	    	System.out.println(transferData.get(j));
 	        str = str.concat(transferData.get(j));
 	        str = str.concat("&");
 	    }
 	    System.out.println(str);
         buf = str.getBytes();
         dos.write(buf);
         dos.flush();
         int read=0;
         int isFirst = 0;
         
         double filesize=0;
         while (true) {
            buf = new byte[1024];
            read = dis.read(buf);
            str = new String(buf).trim();
            filesize += read;
            
            // ���۹��� ���ڿ��� start ��� ���� �غ�
            if (str.contains("start")) {
               System.out.println(" ���� ����  " + str);
               if(isFirst==1) {
                  str = "filenamego";
                  buf = str.getBytes();
                  dos.write(buf);
                  dos.flush();
               }
               isFirst = (isFirst==0) ? 1:0;
               buf = new byte[1024];
               dis.read(buf);
               System.out.println(new String(buf).trim());
               str = new String(buf).trim();

               // ���� ��ü ����
               file = new File("c://mp4//" + str);
               // ���� ���� ��ü ����
               fos = new FileOutputStream(file);

               bos = new BufferedOutputStream(fos);
               str = "go";
               buf = str.getBytes();
               dos.write(buf);
               dos.flush();
               continue;
            }
            // end�� ���� ����
            else if (str.equals("exit")) {
               System.out.println("��ü �Ϸ�");
               //ds.close();
               break;

            }
            // fileEnd�� ���� ���� Yolo������ ���� �غ�.
            else if (str.equals("fileend")) {
               if(isFirst==1) {
                  str = "mp4go";
                  buf = str.getBytes();
                  dos.write(buf);
                  dos.flush();
               }
               System.out.println("���ۿϷ�");
               System.out.println(filesize);
               continue;

            } else {
               // dos�� ����� ���Ͽ� str�� ����Ʈ �迭�� 0���� �Τ��� ���̸�ŭ ���
               bos.write(buf, 0, read);
               bos.flush();
            }
            if(read<=1023 && !str.equals("start") && !str.equals("fileend")) {
               str = "recieve";
               System.out.println("recieve");
               buf = str.getBytes();
               dos.write(buf);
               dos.flush();
                    continue;
            }
         }
         bos.close();
         dis.close();
         dos.close();
         fos.close();
      } catch (IOException i) {
         i.printStackTrace();
         System.out.println("fail");
         String str = "fail";
 	     for(int j=0;j<transferData.size();j++) {
 	    	    System.out.println(transferData.get(j));
    	        str = str.concat(transferData.get(j));
    	        str = str.concat("&");
    	    }
  	    System.out.println(str);
      }
   }

}