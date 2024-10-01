/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.altius.powerpack.rest.controller;

import cc.altius.powerpack.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author altius
 */
@RestController
public class ItemRestController {

    @Autowired
    private ItemService itemService;

    @GetMapping("/getNextLevel/{nextLevel}")
    public ResponseEntity<?> getNextItemList(@PathVariable int nextLevel) {
        try {
            return new ResponseEntity(this.itemService.getNextItemList(nextLevel), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/addItemAtA")
    public ResponseEntity<?> addItemAtA(
            @RequestParam(required = true) String fieldName,
            @RequestParam(required = true) String code,
            @RequestParam(required = true) String desc,
            @RequestParam(required = true) String levelA,
            @RequestParam(required = true) String levelB) {
        try {
            return new ResponseEntity(this.itemService.addItem(fieldName,code,desc,levelA,levelB), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/addItemAtId")
    public ResponseEntity<?> addItemAtId(
            @RequestParam(required = true) String fieldName,
            @RequestParam(required = true) String code,
            @RequestParam(required = true) String desc,
            @RequestParam(required = true) String levelA,
            @RequestParam(required = true) String levelB) {
        try {
            System.out.println("--------------------->"+fieldName+" "+code+" "+desc+" "+levelA+" "+levelB+" ");
            return new ResponseEntity(this.itemService.addItemAtId(fieldName,code,desc,levelA,levelB), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    
    @GetMapping("/getAllItemList")
    public ResponseEntity<?> getItemList() {
        try {
            return new ResponseEntity(this.itemService.getAllItems(), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
