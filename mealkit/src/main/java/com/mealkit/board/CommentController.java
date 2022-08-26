package com.mealkit.board;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mealkit.mapper.CommentMapper;

@RestController
//RestController = Controller + requestBody > returns JSON
@RequestMapping("/reviews")
public class CommentController {

	
	@Inject
	private CommentMapper commentMapper;
	

	//create
	@Transactional
	@RequestMapping(value = "" , method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			commentMapper.create(vo);
			
			String[] files = vo.getFiles();
			
			if(files != null) {
				for(String fileName: files) {
					commentMapper.addAttach(fileName);
				}
			}
			
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
			commentMapper.deleteAttach(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//listed result pagination
	@RequestMapping(value = "/{pid}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(
			@PathVariable("pid") Integer pid,
			@PathVariable("page") Integer page)
	{
		ResponseEntity<Map<String,Object>> entity = null;
		
		//System.out.println("pid="+pid + ", page=" + page);
		
		try {
			CommentCriteria cri = new CommentCriteria();
			cri.setPage(page);
			
			CommentPageMaker pageMaker = new CommentPageMaker();
			pageMaker.setCri(cri);
			
			Map<String,Object> map = new HashMap<String , Object>();
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("pid", pid);
			paramMap.put("cri", cri);
			
			List<CommentVO> list = commentMapper.listPage(paramMap);
			
			System.out.println(list.toString());
			
			map.put("list", list);
			
			int replyCount = commentMapper.count(pid);
			pageMaker.setTotalCount(replyCount);
			
			map.put("commentPageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/getAttach/{rno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("rno") Integer rno)throws Exception{
		return commentMapper.getAttach(rno);
	}
	
	
}