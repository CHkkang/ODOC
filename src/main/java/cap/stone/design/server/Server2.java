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

//192.168.0.47 - 5803 5804
public class Server2 implements Runnable {
	   private String serverIP;
	   private int serverPort;
	   private String fileName = ""; // aaCCTV_2
	   private String fileType = "";
	   private String dirpath;

	   public Server2(String ip, int port, String fileName, String fileType, String dirpath) {
	      this.serverIP = ip;
	      this.serverPort = port;
	      this.fileName = fileName;
	      this.fileType = fileType;
	      this.dirpath = dirpath;
	   }

	   @Override
	   public void run() {
	      DataOutputStream dos = null;
	      DataInputStream dis = null;
	      try (Socket socket = new Socket(serverIP, serverPort)) {
	         OutputStream out = socket.getOutputStream();
	         dos = new DataOutputStream(out);
	         InputStream in = socket.getInputStream();
	         dis = new DataInputStream(in);
	         File file = null;
	         FileOutputStream fos = null;
	         BufferedOutputStream bos = null;

	         // fileName = _ num 까지 들어가서 전송됨.
	         String str = fileName + fileType;
	         // byte[] buf = new byte[1024];

	         // 보내
	         byte[] buf = str.getBytes();
	         dos.write(buf);
	         dos.flush();
	         System.out.println(str);

	         int filesize = 0;

	         file = new File(dirpath + fileName + fileType);
	         fos = new FileOutputStream(file);
	         bos = new BufferedOutputStream(fos);
	         int read = 0;
	         while (true) {
	            buf = new byte[1024];
	            read = dis.read(buf);
	            str = new String(buf).trim();
	            filesize += read;
	            if (str.equals("end")) {
	               System.out.println("end");
	               break;
	            } else {
	               // 소케스로 받은 데이터를 파일에 write
	               bos.write(buf, 0, read);
	               bos.flush();
	            }
	            if (read <= 1023) {
	               str = "recieve";
	               System.out.println("1023보다 작음 " + read);
	               buf = str.getBytes();
	               dos.write(buf);
	               dos.flush();
	               continue;
	            }
	         }
	         System.out.println("끝");
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
