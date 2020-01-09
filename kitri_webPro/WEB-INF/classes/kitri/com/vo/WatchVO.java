package kitri.com.vo;

public class WatchVO {
	int WATCH_NO;
	String SEAT_NO;
	int RESERVED;
	String WATCH_TIME;
	
	public String getWATCH_TIME() {
		return WATCH_TIME;
	}
	public void setWATCH_TIME(String wATCH_TIME) {
		WATCH_TIME = wATCH_TIME;
	}
	public int getWATCH_NO() {
		return WATCH_NO;
	}
	public void setWATCH_NO(int wATCH_NO) {
		WATCH_NO = wATCH_NO;
	}

	public String getSEAT_NO() {
		return SEAT_NO;
	}
	public void setSEAT_NO(String sEAT_NO) {
		SEAT_NO = sEAT_NO;
	}
	public int getRESERVED() {
		return RESERVED;
	}
	public void setRESERVED(int rESERVED) {
		RESERVED = rESERVED;
	}
	
}
