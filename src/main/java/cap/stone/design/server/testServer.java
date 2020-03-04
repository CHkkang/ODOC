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

public class testServer {
   private static int SERVERPORT = 5803;
   private static String SERVERIP = "192.168.0.35";

   static public void main(String args[]) {
      DataOutputStream dos = null;
      DataInputStream dis = null;
      try (Socket socket = new Socket(SERVERIP, SERVERPORT)) {

         // 출력스트림
         OutputStream out = socket.getOutputStream();
         dos = new DataOutputStream(out);
         InputStream in = socket.getInputStream();
         dis = new DataInputStream(in);
         File file = null;
         FileOutputStream fos = null;
         
         String str = "start";
         // byte[] buf = new byte[1024];
         byte[] buf = str.getBytes();

         dos.write(buf);
         dos.flush();

         str = "person&long&long&2e2b3c&70051d&./inputvideo/jj.avi";
         buf = str.getBytes();
         dos.write(buf);
         dos.flush();
         int read=0;
         double filesize=0;

         buf = new byte[1024];
         
         while (true) {
            read = dis.read(buf);
            str = new String(buf).trim();
            filesize += read;
            System.out.println("받는중...");
            if (read <= 0) {
                    continue;
                }
            
            // 전송받은 문자열이 strat 라면 받으룬비
            if (str.startsWith("start")) {
               System.out.println(" 전송 시작  ");
               dis.read(buf);
               System.out.println(new String(buf).trim());
               str = new String(buf).trim();

               // 파일 객체 생성
               file = new File("c://mp4//" + str);
               // 파일 쓰기 객체 새엉
               fos = new FileOutputStream(file);
               
               str = "go";
               buf = str.getBytes();
               dos.write(buf);
               dos.flush();
            }
            // end가 ㅇ면 종료
            else if (str.equals("exit")) {
               System.out.println("전체 완료");
               //ds.close();
               break;

            }
            // end가 ㅇ면 종료
            else if (str.contains("end")) {
               System.out.println("전송완료");
               System.out.println(filesize);
               //ds.close();
               str = "go";
               buf = str.getBytes();
               dos.write(buf);
               dos.flush();
               continue;

            } else {
               // dos에 연결된 파일에 str의 바이ㅌ 배열은 0부터 부ㅜ터 길이많큼 기록
               //fileSize += str.getBytes().length;
               fos.write(buf, 0, read);
            }
         }
         dis.close();
         dos.close();
         fos.close();
      } catch (IOException i) {
         i.printStackTrace();
         System.out.println("fail");
      }
   }

}

