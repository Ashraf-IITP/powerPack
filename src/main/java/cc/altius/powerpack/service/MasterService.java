/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cc.altius.powerpack.service;

import cc.altius.powerpack.model.IdAndLabel;
import java.util.List;

/**
 *
 * @author altius
 */
public interface MasterService {

    public List<IdAndLabel> getRoleList();

    public List<IdAndLabel> getStatusList();
}
