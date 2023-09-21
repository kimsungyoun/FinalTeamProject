package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GameDTO {
	private int g_no;          //���� �Ϸù�ȣ
	private String g_name;     //���� �̸�
	private String g_info;     //���� �Ұ�
	private float g_ratings;   //����
	private String g_tag;      //�±�
	private int g_views;       //���� ��
	private int g_download;    //�ٿ�ε� ��
	private String g_genre;    //���� �帣
	private String g_released; //���� �����
	private int g_saleamount;  //���� �����
}
