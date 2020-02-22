package cap.stone.design.controller;
 
import java.util.ArrayList;
import java.util.List;
 
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class WebSocketController extends TextWebSocketHandler {
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
     
      // Ŭ���̾�Ʈ�� ���� ���Ŀ� ����Ǵ� �޼���
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        System.out.println("{} �����"+ session.getId());
      }
     
      // Ŭ���̾�Ʈ�� ������ �޽����� �������� �� ����Ǵ� �޼���
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println(("{}�� ���� {} ����"+ session.getId()+ message.getPayload()));
        for (WebSocketSession sess : sessionList) {
          sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
        }
      }
     
      // Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
      @Override
      public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        System.out.println(("{} ���� ����"+ session.getId()));
      }
}