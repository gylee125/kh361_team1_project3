package com.mealkit.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mealkit.mapper.CommentMapper;

@RestController
@RequestMapping("/reviews")
public class CommentController {

	
	@Inject
	private CommentMapper commentMapper;
	
	//create
	@RequestMapping(value = "" , method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			commentMapper.create(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// pid mapping후 vo객체를 list화
	@RequestMapping(value = "/all/{pid}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("pid") Integer pid){
		ResponseEntity<List<CommentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(commentMapper.list(pid),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity; 
	}
	
	//update
	@RequestMapping(value="/{rno}",method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody CommentVO vo){
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			commentMapper.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	//delete
	@RequestMapping(value="/{rno}",method = {RequestMethod.DELETE})
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		try {
			commentMapper.delete(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
