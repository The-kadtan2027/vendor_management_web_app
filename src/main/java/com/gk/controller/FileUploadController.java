package com.gk.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gk.model.Vendor;
import com.gk.repository.VendorRepository;
import com.gk.services.FileHandlerService;

@Controller
public class FileUploadController {
	
	private FileHandlerService fileHandler;
	private final VendorRepository repository;
	
	
	
	
	
	@Autowired
	private FileUploadController(FileHandlerService fileHandler, VendorRepository repository) {
		super();
		this.fileHandler = fileHandler;
		this.repository = repository;
	}

	@RequestMapping(value = "/file-upload", method = RequestMethod.GET)
	public String fileUploadPage(ModelMap model) {
		
		return "file-uploader";
	}
	
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("file") MultipartFile file, ModelMap model) throws IOException {
		List<Vendor> fileList = fileHandler.handleFile(file);
		repository.saveAll(fileList);
		return "file-uploader";
	}
	
	
}
