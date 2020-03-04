package cap.stone.design.controller;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CCTVController {
   private List <String> transferData = new ArrayList<String>();
   @RequestMapping("/cctv")
   public String HumanRequest(
         @RequestParam(value="kind",required=true) String kind,
         @RequestParam(value="topKind",required=false, defaultValue = "n") List<String> topkind,
         @RequestParam(value="bottomKind",required=false, defaultValue = "n") List<String> bottomkind,
         @RequestParam(value="onepieceKind",required=false, defaultValue = "n") List<String> toponepiecekind,
         @RequestParam(value="thingKind",required=false, defaultValue = "n") List<String> thingkind,
         @RequestParam(value="petKind",required=false, defaultValue = "n") List<String> petkind,
         @RequestParam(value="topColor", required=false, defaultValue = "n") String topcolor,
         @RequestParam(value="bottomColor", required=false, defaultValue = "n") String bottomcolor,
         @RequestParam(value="onepieceColor", required=false, defaultValue = "n") String onepiececolor){ 
      transferData.add(kind);
      if(kind.equals("human")) {   
         if(topkind.get(0).equals("n") && bottomkind.get(0).equals("n")) {
            transferData.add(toponepiecekind.get(0));
         }else {
            transferData.add(topkind.get(0));
            transferData.add(bottomkind.get(0));
         }
         if(topcolor.equals("n") && bottomcolor.equals("n")) {
        	 System.out.println("onepiececolor : "+onepiececolor);
       	  transferData.add(onepiececolor);
         }
         else {
        	 System.out.println("topcolor : "+topcolor + " bottomcolor : " + bottomcolor);
       	  transferData.add(topcolor);
       	  transferData.add(bottomcolor);
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
                       buf,buf.length,ip,5801);
               
               socket.send(packet);
               System.out.println("success");
           }catch(IOException i){
               i.printStackTrace();
               System.out.println("fail");
           }
   }
}