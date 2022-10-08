package source;

public class Account {
	private String id;
	private String password;
	private int whetherAdmin;
	private String code;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getWhetherAdmin() {
		return whetherAdmin;
	}
	public void setWhetherAdmin(int whetherAdmin) {
		this.whetherAdmin = whetherAdmin;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
