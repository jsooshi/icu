package com.porget.persistence;

import com.porget.domain.RecruiterVO;

public interface RecruiterDAO {
	public void insertRecruiter(RecruiterVO rvo);
	public String login(RecruiterVO rvo);
	public int cidCheck(String cname);
	public int cemailCheck(String cemail);

}
