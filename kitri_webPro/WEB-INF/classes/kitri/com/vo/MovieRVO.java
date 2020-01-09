package kitri.com.vo;

public class MovieRVO {
	int rate_no;
	int movie_no;
	 String id;
	double rate;
	String comments;
	String regdate;
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRate_no() {
		return rate_no;
	}
	public void setRate_no(int rate_no) {
		this.rate_no = rate_no;
	}
}
