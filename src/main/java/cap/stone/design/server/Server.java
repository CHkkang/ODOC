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

// 192.168.0.47 - 5803 5804
public class Server implements Runnable {
	   private String serverIP;
	   private int serverPort;
	   private String msg;

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
	         OutputStream out = socket.getOutputStream();
	         dos = new DataOutputStream(out);
	         InputStream in = socket.getInputStream();
	         dis = new DataInputStream(in);

	         String str = "start";
	         // byte[] buf = new byte[1024];
	         byte[] buf = str.getBytes();

	         // 보내
	         dos.write(buf);
	         dos.flush();

	         int read = 0;
	         
	         // read 받아야해
	         buf = new byte[1024];
	         read = dis.read(buf);
	         str = new String(buf).trim();

	         if (str.equals("Pready")) {
	            // 보내
	            str = msg;
	            buf = str.getBytes();
	            dos.write(buf);
	            dos.flush();
	            System.out.println(str);

	            System.out.println("끝");
	            dis.close();
	            dos.close();
	         }
	      } catch (IOException i) {
	         i.printStackTrace();
	         System.out.println("fail");
	         String str = "fail";
	         System.out.println(str);
	      }
	   }
	}