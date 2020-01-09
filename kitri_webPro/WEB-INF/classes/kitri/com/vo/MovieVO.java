package kitri.com.vo;

public class MovieVO {
	int movie_no;
	String TITLE; 
	String DIRECTOR;
	String ACTOR;
	String GENRE;
	String AGE;
	String OPENDATE;
	String IMG_NAME;
	String IMG_SRC;
	double avgrate;
	String trailer;
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public double getAvgrate() {
		return avgrate;
	}
	public void setAvgrate(double avgrate) {
		this.avgrate = avgrate;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getDIRECTOR() {
		return DIRECTOR;
	}
	public void setDIRECTOR(String dIRECTOR) {
		DIRECTOR = dIRECTOR;
	}
	public String getACTOR() {
		return ACTOR;
	}
	public void setACTOR(String aCTOR) {
		ACTOR = aCTOR;
	}
	public String getGENRE() {
		return GENRE;
	}
	public void setGENRE(String gENRE) {
		GENRE = gENRE;
	}
	public String getAGE() {
		return AGE;
	}
	public void setAGE(String aGE) {
		AGE = aGE;
	}
	public String getOPENDATE() {
		return OPENDATE;
	}
	public void setOPENDATE(String oPENDATE) {
		OPENDATE = oPENDATE;
	}
	public String getIMG_NAME() {
		return IMG_NAME;
	}
	public void setIMG_NAME(String iMG_NAME) {
		IMG_NAME = iMG_NAME;
	}
	public String getIMG_SRC() {
		return IMG_SRC;
	}
	public void setIMG_SRC(String iMG_SRC) {
		IMG_SRC = iMG_SRC;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
}
