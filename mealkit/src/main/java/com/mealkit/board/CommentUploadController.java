package com.mealkit.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CommentUploadController {

	private static final Logger logger = LoggerFactory.getLogger(CommentUploadController.class);

	@Resource(name = "fileuploadPath")
	private String fileuploadPath;

	@RequestMapping(value = "/fileuploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "/fileuploadForm", method = RequestMethod.POST)
	public void uploadForm(MultipartFile file, Model model) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedFileName", savedFileName);

		// jspFileNameString
		// return "uploadResult";

	}

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
	}

	
	//ajaxupload
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(@RequestParam("fileupload[]") List<MultipartFile> files) throws Exception {

		
//		while(file.iterator().hasNext()) {
		
		for(MultipartFile file : files) {
		
//			logger.info("originalName: " + file.listIterator(0) );
			/*
			 * return new ResponseEntity<>( UploadFileUtils.uploadFile(fileuploadPath,
			 * file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
			 */
			logger.info(UploadFileUtils.uploadFile(fileuploadPath, file.getOriginalFilename(), file.getBytes()));
		}
		
		return new ResponseEntity<>(HttpStatus.CREATED);
				
	}

	//neverused
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();

		String savedFileName = uid.toString() + "_" + originalName;

		File target = new File(fileuploadPath, savedFileName);

		FileCopyUtils.copy(fileData, target);

		return savedFileName;

	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String savedFileName) throws Exception {

		InputStream is = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + savedFileName);

		try {

			String formatName = savedFileName.substring(savedFileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			is = new FileInputStream(fileuploadPath + savedFileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				savedFileName = savedFileName.substring(savedFileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(savedFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			is.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(fileuploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(fileuploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {

		logger.info("delete all files: " + files);

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			if (mType != null) {

				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(fileuploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}

			new File(fileuploadPath + fileName.replace('/', File.separatorChar)).delete();

		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
