package cap.stone.design.server;

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

//192.168.0.47 - 5803 5804
public class Server implements Runnable {
   private String serverIP;
   private int serverPort;
   
   //private static final String dirpath = "/fpSpringMVC/src/main/webapp/resources/python/";
   private final String dirpath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\python";
   private String msg = "person&long&long&0022ff&0022ff&test1";
   public Server(String ip, int port) {
         this.serverIP = ip;
         this.serverPort = port;
      }
   public void setMsg(String msg) {
      this.msg = msg;
   }

   @Override
   public void run() {
	      DataOutputStream dos = null;
	      DataInputStream dis = null;
	      try (Socket socket = new Socket(serverIP, serverPort)) {

	         System.out.println("������ʹ� server�� �Ѿ�°�");
	         System.out.println(msg);
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
	         System.out.println(msg);
	         str = msg;
	         buf = str.getBytes();
	         dos.write(buf);
	         dos.flush();
	         int read = 0;
	         int isFirst = 0;

	         double filesize = 0;
	         while (true) {
	            buf = new byte[1024];
	            read = dis.read(buf);
	            str = new String(buf).trim();
	            filesize += read;

	            // ���۹��� ���ڿ��� start ��� ���� �غ�
	            if (str.equals("start")) {
	               System.out.println(" ���� ����  " + str);
	               try {
	                  Thread.sleep(1000);
	               } catch (InterruptedException e) {
	                  // TODO Auto-generated catch block
	                  e.printStackTrace();
	               }
	               if (isFirst == 1) {
	                  System.out.println(" filenamego ���� ");
	                  str = "filenamego";
	                  buf = str.getBytes();
	                  dos.write(buf);
	                  dos.flush();
	                  isFirst = 0;
	               }else { isFirst = 1; }
	               
	               buf = new byte[1024];
	               dis.read(buf);
	               System.out.println(new String(buf).trim());
	               str = new String(buf).trim();
	               // ���� ��ü ����
	               file = new File(dirpath + str);
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
	               // ds.close();
	               break;

	            }
	            // fileEnd�� ���� ���� Yolo������ ���� �غ�.
	            else if (str.equals("fileend")) {
	               if (isFirst == 1) {
	                  System.out.println("mp4go ����");
	                  str = "mp4go";
	                  buf = str.getBytes();
	                  dos.write(buf);
	                  dos.flush();
	               }
	               System.out.println("���� �Ϸ� : fileend ����");
	               System.out.println(filesize);
	               filesize=0;
	               //dis.read();
	               continue;

	            } else {
	               // dos�� ����� ���Ͽ� str�� ����Ʈ �迭�� 0���� �Τ��� ���̸�ŭ ���
	               bos.write(buf, 0, read);
	               bos.flush();
	               System.out.println("** ��Ŷũ��  "+ Integer.toString(read) );
	               if(read<=1023) {
	                  if(isFirst==0)
	                     str = "mp4recieve";
	                  else
	                     str = "txtrecieve";
	                  
	                  buf = str.getBytes();
	                  dos.write(buf);
	                  dos.flush();
	               }
	            }
	            /*if (read <= 1023 && !str.equals("start") && !str.equals("fileend")) {
	               str = "recieve";
	               System.out.println("������ ��Ŷ : recieve ����");
	               buf = str.getBytes();
	               dos.write(buf);
	               dos.flush();
	               continue;
	            }*/
	         }
	         bos.close();
	         dis.close();
	         dos.close();
	         fos.close();
	      } catch (IOException i) {
	         i.printStackTrace();
	         System.out.println("fail");
	         String str = "fail";
	         System.out.println(str);
	      }
	   }

}