package cap.stone.design.service;

import org.springframework.stereotype.Service;
import cap.stone.design.model.Human;

@Service
public class HumanService {
   Human human = new Human();

   public String getString() {

      String returnString = "person";

      if (human.getOnepieceKind() != null) {
         returnString = returnString + "&" + human.getOnepieceKind() + "&" + human.getOnepieceColor() + "&"; // ��������
                                                                                    // �����̸�
                                                                                    // �߰��������
      } else {
         returnString = returnString + "&" + human.getTopKind() + "&" + human.getBottomKind() + "&"
               + human.getTopColor() + "&" + human.getBottomColor() + "&"; // �������� �����̸� �߰��������
      }

      return returnString;
   }
}