package kitri.com.vo;

public class MemberVO {
	int NO;
	
	String ZIPCODE;
	String ID;//
	String PASSWORD;//
	String NAME;//
	String GENDER;//
	String ADDRESS;
	String TEL;//
	String CP;//
	String EMAIL;//
	String BIRTH;
	String ADMIN;
	

	public int getNO() {
		return NO;
	}

	public void setNO(int nO) {
		NO = nO;
	}



	public String getZIPCODE() {
		return ZIPCODE;
	}

	public void setZIPCODE(String zIPCODE) {
		ZIPCODE = zIPCODE;
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

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getCP() {
		return CP;
	}

	public void setCP(String cP) {
		CP = cP;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getBIRTH() {
		return BIRTH;
	}

	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}

	public String getADMIN() {
		return ADMIN;
	}

	public void setADMIN(String aDMIN) {
		ADMIN = aDMIN;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}

	@Override
	public String toString() {
		return "MemberVO [NO=" + NO + ", ZIPCODE=" + ZIPCODE + ", ID=" + ID + ", PASSWORD=" + PASSWORD + ", NAME="
				+ NAME + ", GENDER=" + GENDER + ", ADDRESS=" + ADDRESS + ", TEL=" + TEL + ", CP=" + CP + ", EMAIL="
				+ EMAIL + ", BIRTH=" + BIRTH + ", ADMIN=" + ADMIN + "]";
	}



}
