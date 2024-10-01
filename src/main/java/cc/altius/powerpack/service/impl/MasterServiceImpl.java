/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.service.impl;

import cc.altius.powerpack.dao.MasterDao;
import cc.altius.powerpack.model.IdAndLabel;
import cc.altius.powerpack.service.MasterService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author altius
 */
@Service
public class MasterServiceImpl implements MasterService{

    @Autowired
    private MasterDao masterDao;

    @Override
    public List<IdAndLabel> getRoleList() {
        return this.masterDao.getRoleList();
    }

    @Override
    public List<IdAndLabel> getStatusList() {
        return masterDao.getStatusList();
    }
    
}
