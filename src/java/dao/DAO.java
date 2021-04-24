/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author rivaa
 */
public interface DAO<T> {
    
    void create(T ob) throws Exception;
    List<T> read() throws Exception;
    void update(T object) throws Exception;
    void delete(String id) throws Exception;
    
    
    
}
