package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewsDTO {
	private int n_no;             //���� �Ϸù�ȣ
	private String n_title;       //��� ����
	private String n_reporter;    //��� �ۼ���
	private String n_writedate;   //�ۼ� ����
	private String n_content;     //��� ����
	private int n_hit;            //��� ��ȸ��
	private String n_source;      //���� ��ó
}