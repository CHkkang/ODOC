package cap.stone.design.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CCTVController {
	private List <String> transferData = new ArrayList<String>();
	@RequestMapping("/cctv")
	public String HumanRequest(
			@RequestParam(value="kind",required=true) String kind,
			@RequestParam(value="topKind",required=false, defaultValue = "n") List<String> topkind,
			@RequestParam(value="bottomKind",required=false, defaultValue = "n") List<String> bottomkind,
			@RequestParam(value="onepieceKind",required=false, defaultValue = "n") List<String> onepiecekind,
			@RequestParam(value="thingKind",required=false, defaultValue = "n") List<String> thingkind,
			@RequestParam(value="petKind",required=false, defaultValue = "n") List<String> petkind){ 
		transferData.add(kind);
		if(kind.equals("human")) {	
			if(topkind.get(0).equals("n") && bottomkind.get(0).equals("n")) {
				transferData.add(onepiecekind.get(0));
				transferData.add(onepiecekind.get(1));
			}else {
				transferData.add(topkind.get(0));
				transferData.add(bottomkind.get(0));
			}
		}else if(kind.equals("thing")) {
			transferData.add(thingkind.get(0));
		}else if(kind.equals("pets")) {
			transferData.add(petkind.get(0));
		}
		for(int i=0;i<transferData.size();i++) {
			System.out.println(transferData.get(i));
		}
		socketCommunication(transferData);
		transferData = new ArrayList<String>();
		return "cctv";

   }
	public void socketCommunication(List<String> transferData) {
		 try{   
	            InetAddress ip = InetAddress.getByName("192.168.219.101");
	            DatagramSocket socket = new DatagramSocket(5801);
	            System.out.print("message : ");
	            
	            String ex = "Hello, World!";
	            byte[] buf = ex.getBytes();
	            
	            DatagramPacket packet = new DatagramPacket(
	                    buf,buf.length,ip,35000);
	            
	            socket.send(packet);
	            System.out.println("전송 완료");
	        }catch(IOException i){
	            i.printStackTrace();
	            System.out.println("전송 실패");
	        }
	}
}
