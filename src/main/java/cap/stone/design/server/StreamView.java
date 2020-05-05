package cap.stone.design.server;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.AbstractView;
 
/**
 * ����Ͽ��� ������ ��Ʈ���� �����ϴ� Ŭ����
 */
@Component("streamView")
public class StreamView extends AbstractView {
     
 
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
 
         //��� ������ ���ϸ�
        String movieFile = (String)model.get("movieFile");
        String fileName = StringUtils.getFilename(movieFile);
 
        //progressbar ���� Ư�� ��ġ�� Ŭ���ϰų� �ؼ� ���� ��ġ�� ������ ��û�� �� �����Ƿ�
        //������ ������ ��ġ���� �о���� ���� RandomAccessFile Ŭ������ ����Ѵ�.
        //�ش� ������ ���� ��� ���� �߻�
        RandomAccessFile randomFile = new RandomAccessFile(new File(movieFile), "r");
 
        long rangeStart = 0; //��û ������ ���� ��ġ
        long rangeEnd = 0;  //��û ������ �� ��ġ
        boolean isPart=false; //�κ� ��û�� ��� true, ��ü ��û�� ��� false
 
        //randomFile �� Ŭ���� �ϱ� ���Ͽ� try~finally ���
        try{
            //������ ���� ũ��
            long movieSize = randomFile.length();
            //��Ʈ�� ��û ����, request�� ������� range�� �д´�.
            String range = request.getHeader("range");
 
            //�������� ���� range ������ �ٸ���, �⺻ ������ "bytes={start}-{end}" �����̴�.
            //range�� null�̰ų�, reqStart��  0�̰� end�� ���� ��� ��ü ��û�̴�.
            //��û ������ ���Ѵ�.
            if(range!=null) {
                //ó���� ���Ǹ� ���� ��û range�� end ���� ���� ��� �־���
                if(range.endsWith("-")){
                    range = range+(movieSize - 1);
                }
                int idxm = range.trim().indexOf("-");                           //"-" ��ġ
                rangeStart = Long.parseLong(range.substring(6,idxm));
                rangeEnd = Long.parseLong(range.substring(idxm+1));
                if(rangeStart > 0){
                    isPart = true;
                }
           }else{   //range�� null�� ��� ������ ��ü ũ��� �ʱⰪ�� �־���. 0���� �����ϹǷ� -1
                rangeStart = 0;
                rangeEnd = movieSize - 1;
           }
 
           //���� ���� ũ��
           long partSize = rangeEnd - rangeStart + 1;
 
           //���۽���
           response.reset();
 
           //��ü ��û�� ��� 200, �κ� ��û�� ��� 206�� ��ȯ���� �ڵ�� ����
           response.setStatus(isPart ? 206 : 200);
 
           //mime type ����
           //response.setContentType("video/mp4");
           response.setContentType("video/" + StringUtils.getFilenameExtension(fileName));
 
           //���� ������ ��忡 �־��ش�. �������� ���� ��ü ũ�⸦ �ִ´�.
           response.setHeader("Content-Range", "bytes "+rangeStart+"-"+rangeEnd+"/"+movieSize);
           response.setHeader("Accept-Ranges", "bytes");
           response.setHeader("Content-Length", ""+partSize);
    
           OutputStream out = response.getOutputStream();
           //������ ������ ���۽��� ��ġ ����
           randomFile.seek(rangeStart);
    
           //���� ����...  java io�� 1ȸ ���� byte���� int�� ������
           //������ ������ ��� int�����δ� ó�� �ȵǴ� ũ���� ������ �����Ƿ�
           //8kb�� �߶� ������ ũ�Ⱑ ũ���� ������ ���� �ʵ��� ����
           int bufferSize = 8*1024;
           byte[] buf = new byte[bufferSize];
           do{
               int block = partSize > bufferSize ? bufferSize : (int)partSize;
               int len = randomFile.read(buf, 0, block);
               out.write(buf, 0, len);
               partSize -= block;
           }while(partSize > 0);
       }catch(IOException e){
           //���� �߿� �������� �ݰų�, ȭ���� ��ȯ�� ��� �����ؾ� �ϹǷ� �������.
           // progressBar�� Ŭ���� ��쿡�� Ŭ���� ��ġ������ ���û�� �����Ƿ� ���� ���.
           logger.debug("������ ��� �Ǿ���" ); 
       }finally{
           randomFile.close();
       }
     
    }
 
}
