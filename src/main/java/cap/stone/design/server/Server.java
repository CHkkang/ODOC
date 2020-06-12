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
	private String msg = "person&long&long&0022ff&0022ff&aaCCTV";
	private String dirpath;

	public Server(String ip, int port, String dirpath) {
		this.serverIP = ip;
		this.serverPort = port;
		this.dirpath = dirpath;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	private String fileName = "";

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

			String str = "start";
			// byte[] buf = new byte[1024];
			byte[] buf = str.getBytes();

			// 보내
			dos.write(buf);
			dos.flush();

			int read = 0;
			int isFirst = 0;

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

				buf = new byte[1024];
				read = dis.read(buf);
				str = new String(buf).trim();
				fileName = str;
				System.out.println(str);
				// test1 = filename -> test1_1.mp4
				String str1 = fileName + "1";
				buf = str1.getBytes();
				dos.write(buf);
				dos.flush();

				System.out.println(str1);
				int filesize = 0;

				file = new File(dirpath + str1 + ".mp4");
				fos = new FileOutputStream(file);
				bos = new BufferedOutputStream(fos);

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
			}
		} catch (IOException i) {
			i.printStackTrace();
			System.out.println("fail");
			String str = "fail";
			System.out.println(str);
		}
	}
}