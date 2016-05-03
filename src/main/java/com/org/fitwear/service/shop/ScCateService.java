package com.org.fitwear.service.shop;

import java.util.List;

import com.org.fitwear.model.shop.ScCategory;
import com.org.system.model.manager.Page;

public interface ScCateService {

	public ScCategory get(Long id);

	public void save(ScCategory entity);

	public void update(ScCategory entity);

	public void delete(Long id);

	public List<ScCategory> getAll();

	public List<ScCategory> search(ScCategory entity);

	public Page<ScCategory> search(Page<ScCategory> page, ScCategory entity);

}
