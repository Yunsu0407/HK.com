package model;

// 기본키, 이름, 가격, 이미지(url), 설명
public class Product {
	private int product_id; // primary key
	private String product_name;
	private int product_price;
	private String product_imgUrl;
	private String product_description;
	private int product_size_l;
	private int product_size_m;
	private int product_size_s;

	public Product(int product_id, String product_name, int product_price, String product_imgUrl) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_imgUrl = product_imgUrl;
	}

	public Product(int product_id, String product_name, int product_price, String product_imgUrl, String product_description, int product_size_l, int product_size_m, int product_size_s) {
		this(product_id, product_name, product_price, product_imgUrl);
		this.product_description = product_description;
		this.product_size_l = product_size_l;
		this.product_size_m = product_size_m;
		this.product_size_s = product_size_s;
	}

	public int getProduct_id() {
		return product_id;
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

	public String getProduct_description() {
		return product_description;
	}

	public int getProduct_size_l() {
		return product_size_l;
	}

	public int getProduct_size_m() {
		return product_size_m;
	}

	public int getProduct_size_s() {
		return product_size_s;
	}

}
