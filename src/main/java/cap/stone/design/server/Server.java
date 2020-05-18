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

	         System.out.println("여기부터는 server로 넘어온것");
	         System.out.println(msg);
	         // 출력스트림
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

	            // 전송받은 문자열이 start 라면 받을 준비
	            if (str.equals("start")) {
	               System.out.println(" 전송 시작  " + str);
	               try {
	                  Thread.sleep(1000);
	               } catch (InterruptedException e) {
	                  // TODO Auto-generated catch block
	                  e.printStackTrace();
	               }
	               if (isFirst == 1) {
	                  System.out.println(" filenamego 전송 ");
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
	               // 파일 객체 생성
	               file = new File(dirpath + str);
	               // 파일 쓰기 객체 새엉
	               fos = new FileOutputStream(file);

	               bos = new BufferedOutputStream(fos);
	               str = "go";
	               buf = str.getBytes();
	               dos.write(buf);
	               dos.flush();
	               continue;
	            }
	            // end가 ㅇ면 종료
	            else if (str.equals("exit")) {
	               System.out.println("전체 완료");
	               // ds.close();
	               break;

	            }
	            // fileEnd가 오면 다음 Yolo동영상 받을 준비.
	            else if (str.equals("fileend")) {
	               if (isFirst == 1) {
	                  System.out.println("mp4go 전송");
	                  str = "mp4go";
	                  buf = str.getBytes();
	                  dos.write(buf);
	                  dos.flush();
	               }
	               System.out.println("전송 완료 : fileend 수신");
	               System.out.println(filesize);
	               filesize=0;
	               //dis.read();
	               continue;

	            } else {
	               // dos에 연결된 파일에 str의 바이트 배열은 0부터 부ㅜ터 길이많큼 기록
	               bos.write(buf, 0, read);
	               bos.flush();
	               System.out.println("** 패킷크기  "+ Integer.toString(read) );
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
	               System.out.println("마지막 패킷 : recieve 전송");
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