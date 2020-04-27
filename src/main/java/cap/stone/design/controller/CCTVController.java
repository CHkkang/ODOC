package cap.stone.design.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.model.TimeMarker;
import cap.stone.design.service.Server;

@Controller
public class CCTVController {
   private List <String> transferData = new ArrayList<String>();
   private Server server = new Server("192.168.219.101", 5803);
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
         @RequestParam(value="onepieceColor", required=false, defaultValue = "n") String onepiececolor,
         TimeMarker timemarker){ 
      transferData.add(kind);
      
      //사람일 때 데이터 정리
      if(kind.equals("human")) {   
         if(topkind.get(0).equals("n") && bottomkind.get(0).equals("n")) {
            transferData.add(toponepiecekind.get(0));
            transferData.add(onepiececolor);
         }
         else if(bottomkind.get(0).equals("n") && !topkind.get(0).equals("n")){
        	 transferData.add(topkind.get(0));
        	 transferData.add(topcolor);
         }
         else if(!bottomkind.get(0).equals("n") && topkind.get(0).equals("n")) {
        	 transferData.add(bottomkind.get(0));
        	 transferData.add(bottomcolor);
         }
         else {
            transferData.add(topkind.get(0));
            transferData.add(bottomkind.get(0));
      	    transferData.add(topcolor);
      	    transferData.add(bottomcolor);
         }
      // 사물일때
      }else if(kind.equals("thing")) {
         transferData.add(thingkind.get(0));
      }
      // 동물일때
      else if(kind.equals("pets")) {
         transferData.add(petkind.get(0));
      }
      
      
		/*
		 * for(int i=0;i<transferData.size();i++) {
		 * System.out.println(transferData.get(i)); } // python 서버로 송신/수신 try {
		 * server.run(transferData); } catch (InterruptedException e) {
		 * e.printStackTrace(); } transferData = new ArrayList<String>();
		 */
      ArrayList<String> timeList = new ArrayList<>();
	   String line = null;
	   // 파일로 부터 읽어들인 조각들을 저장하는것
	   String getLine = "";
      try{
          //파일 객체 생성
    	  ClassPathResource resource = new ClassPathResource("timetxt/airport.txt");
    	  File file = resource.getFile();
//          File file = new File("/webapp");
           //입력 스트림 생성
    	   FileReader reader = new FileReader(file);
    	   // 정수가 저장된 파일을 읽는다
    	   BufferedReader rd = new BufferedReader(reader);

    	   while ((line = rd.readLine()) != null) {
    	    System.out.println(line);
    	    getLine = getLine + line;
    	    // 읽어서 최종 String에 저장시킨다
    	   }
    	   rd.close();
          }catch (FileNotFoundException e) {
        	  System.out.print("파일 못찾는 실패");
              e.getStackTrace();
          }catch(IOException e){
        	  System.out.print("io실패");
              e.getStackTrace();
          }

      getLine = getLine.replace("[","");
      getLine = getLine.replace("]","");
      System.out.println(getLine);
      StringTokenizer st = new StringTokenizer(getLine, ",");

      while (st.hasMoreTokens()) {
       timeList.add(st.nextToken());
       // 짤라준 조각들을 배열에 저장
      }  
      System.out.println(timeList);
      timemarker.setSec(timeList);
     
      return "cctv";

   }
}