package com.kh.nuts.shopping;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ShoppingVO {
	String title;
	String link;
	String image;
	String lprice;
	String hprice;
	String mallName;
	String productId;
	String productType; 
	String maker;
	String brand;
	String category1;
	String category2;
	String category3;
	String category4;
	
}
