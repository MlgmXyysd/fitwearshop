package com.org.fitwear.service.shop;

import java.util.List;

import com.org.fitwear.model.shop.FitwearMagent;
import com.org.system.model.manager.Page;

public interface FitwearMagentService {
	
	public FitwearMagent get(Long id);

	public void save(FitwearMagent entity);

	public void update(FitwearMagent entity);

	public void delete(Long id);

	public List<FitwearMagent> getAll();

	public List<FitwearMagent> search(FitwearMagent entity);

	public Page<FitwearMagent> search(Page<FitwearMagent> page, FitwearMagent entity);

}
