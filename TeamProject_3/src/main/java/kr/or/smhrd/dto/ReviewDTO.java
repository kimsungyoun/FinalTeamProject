package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int r_no;            //���� �Ϸù�ȣ
	private int g_no;            //���� ��ȣ
	private String r_user;       //���� �ۼ���
	private String r_writedate;  //���� �ۼ���
	private float r_ratings;     //���� ����
	private String r_content;    //���� ����
}
