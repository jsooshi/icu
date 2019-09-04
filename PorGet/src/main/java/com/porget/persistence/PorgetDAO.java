package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.Porget_recruiterVO;
import com.porget.domain.Portget_ordinaryVO;

public interface PorgetDAO {
	
	public List<Portget_ordinaryVO> selectAll(Map map);
	public List<Porget_recruiterVO> selectAllRec(Map map);

	public Portget_ordinaryVO select(String uemail);
	public void update(Portget_ordinaryVO vo);
	
	public Porget_recruiterVO selectRec(String cemail);
	public void updateRec(Porget_recruiterVO vo);
	
	
	public void delete(String uemail);
	public void deleteRec(String cemail);
	
	public List<Portget_ordinaryVO> listAll(int base);
}
