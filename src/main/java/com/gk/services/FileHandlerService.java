package com.gk.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gk.model.Vendor;

@Service
public class FileHandlerService {

	public List<Vendor> handleFile(MultipartFile file) throws IOException {
		List<Vendor> list = new ArrayList<>();
		Scanner sc = new Scanner(file.getInputStream());
		sc.nextLine();
		while(sc.hasNext()) {
			String[] line = sc.nextLine().split(",");
			list.add(new Vendor(line[0], line[1], line[2], line[3], line[4], line[5], line[6], line[7], line[8]));
		}
		System.out.println(list);
		sc.close();
		return list;
	}
}
