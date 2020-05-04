/*
 * package cap.stone.design.server;
 * 
 * import java.io.File; import java.io.RandomAccessFile; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Value; import
 * org.springframework.stereotype.Component; import
 * org.springframework.web.servlet.view.AbstractView;
 * 
 * @Component("streamView") public class StremView extends AbstractView {
 * 
 * @Value("#{dir['movieDir']}") private String movieDir;
 * 
 * protected void renderMergedOutputModel(Map<String, Object> map,
 * HttpServletRequest request, HttpServletRequest response) throws Exception {
 * 
 * //동영상 파일명 String aviName = (String)map.get("movieName");
 * 
 * RandomAccessFile randomFile = new RandomAccessFile(new File(movieDir,
 * aviName),"r");
 * 
 * long rangeStart = 0; long rangeEnd = 0; boolean isPart = false;
 * 
 * try { //동영상 파일 크기 long movieSize = randomFile.length(); String range =
 * request.getHeader("range"); logger.debug("range:{}", range);
 * 
 * if(range!=null) { if(range.endsWith("-")){ range = range+(movieSize - 1); }
 * int idxm = range.trim().indexOf("-"); rangeStart =
 * Long.parseLong(range.substring(6,idxm)); rangeEnd =
 * Long.parseLong(range.substring(idxm+1)); if(rangeStart > 0){ isPart = true; }
 * }else{ //range가 null인 경우 동영상 전체 크기로 초기값을 넣어줌. 0부터 시작하므로 -1 rangeStart = 0;
 * rangeEnd = movieSize - 1; }
 * 
 * //전송 파일 크기 long partSize = rangeEnd - rangeStart + 1;
 * 
 * response.reset(); response.setStatus(isPart ? 206 : 200);
 * response.setContentType("video/mp4"); }
 * 
 * } }
 */