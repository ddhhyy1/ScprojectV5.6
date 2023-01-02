package com.studycafe.prac.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScSalesDto {

	
	private int salesNo;
	private String userId;
	private String price;
	private String salesDate;
	private String sumSales;
}
