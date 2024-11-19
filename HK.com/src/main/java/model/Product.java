package model;

// 기본키, 이름, 가격, 이미지(url), 설명
public class Product {
	private int product_key; // primary key
	private String product_name;
	private int product_price;
	private String product_imgUrl;
	private String product_description;

	public Product(int product_key, String product_name, int product_price, String product_imgUrl) {
		this.product_key = product_key;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_imgUrl = product_imgUrl;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public int getProduct_key() {
		return product_key;
	}

	public String getProduct_name() {
		return product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public String getProduct_imgUrl() {
		return product_imgUrl;
	}

}
