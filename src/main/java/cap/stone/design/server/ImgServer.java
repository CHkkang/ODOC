package cap.stone.design.server;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class ImgServer  implements Runnable {
   private String serverIP;
   private int serverPort;
   private String mp4name = "";
   private String imgname="";
 
   public ImgServer(String ip, int port, String imgname, String mp4name) {
      this.serverIP = ip;
      this.serverPort = port;
      this.imgname = imgname;
      this.mp4name = mp4name;
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

         String str = "imgstart";
         byte[] buf = str.getBytes();

         // 보내
         dos.write(buf);
         dos.flush();

         int read = 0;
         
         // read 받아야해
         buf = new byte[1024];
         read = dis.read(buf);
         str = new String(buf).trim();
         System.out.println("ddd");
         if (str.equals("imgready")) {
            System.out.println("imgready");

            // 동영상 이름 보내
            buf = mp4name.getBytes();
            dos.write(buf);
            dos.flush();
            
            buf = new byte[1024];
            read = dis.read(buf);
            str = new String(buf).trim();
            
            if(str.equals("start")) {
               // imggo 받고 이미지 보내 
               File file = new File(imgname);
               FileInputStream fis = new FileInputStream(file);
               BufferedInputStream bis = new BufferedInputStream(fis);
               
               int len;
               buf = new byte[1024];
               while((len=bis.read(buf))!=-1) {
                  dos.write(buf, 0, len);
               }
               
               dos.flush();
            }
            
            try {
               Thread.sleep(1000);
            } catch (InterruptedException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
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