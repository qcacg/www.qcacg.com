package com.qcacg.service.system.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.qcacg.entity.RoleEntity;
import com.qcacg.mapper.RoleMapper;
import com.qcacg.service.BaseServiceImpl;
import com.qcacg.service.system.RoleService;

@Service
public class RoleServiceImpl extends BaseServiceImpl<RoleEntity>implements RoleService
{
	@Autowired
	private RoleMapper roleMapper;

	public PageInfo<RoleEntity> queryRoleForList()
	{
		return this.queryPageForList();
	}

	public String saveOrUpdate(RoleEntity roleEntity)
	{
		if (roleEntity.getRoleId() == null)
		{
			return this.save(roleEntity);
		}
		return this.update(roleEntity);
	}

	public List<RoleEntity> findRoleByUser(String userId)
	{
		return this.roleMapper.findRoleByUser(userId);
	}

}
