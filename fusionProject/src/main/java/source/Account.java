package source;

public class Account {
	private String ID;
	private String PASSWORD;
	private int WHETHERADMIN;
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public int getWHETHERADMIN() {
		return WHETHERADMIN;
	}
	public int setWHETHERADMIN(int wHETHERADMIN) {
		return WHETHERADMIN = wHETHERADMIN;
	}
	
}
