package com.org.fitwear.service.shop;

import java.util.List;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.system.model.manager.Page;

public interface FitwearAppService {

	public FitwearApp get(Long id);

	public void save(FitwearApp entity);

	public void update(FitwearApp entity);

	public void delete(Long id);

	public List<FitwearApp> getAll();

	public List<FitwearApp> search(FitwearApp entity);

	public Page<FitwearApp> search(Page<FitwearApp> page, FitwearApp entity);
}
