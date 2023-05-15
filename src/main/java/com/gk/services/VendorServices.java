package com.gk.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.gk.model.Vendor;
import com.gk.repository.VendorRepository;

@Service
public class VendorServices implements VendorService{
	
	private final VendorRepository vendorRepository;
	
	@Autowired
	private VendorServices(VendorRepository vendorRepository) {
		super();
		this.vendorRepository = vendorRepository;
	}

	
	@Override
	public void saveVendor(Vendor vendor) {
//		vendor.setVendorId(++count);
		vendorRepository.save(vendor);
	}
	
	@Override
	public List<Vendor> getAllVendor(){
		return vendorRepository.findAll();
	}
	

	@Override
	public void deleteByVendorId(int vendorId) {
		vendorRepository.deleteById(vendorId);
		
	}

	@Override
	public void updateVendor(Vendor vendor) {
		vendorRepository.save(vendor);
		
	}
	@Override
	public Page<Vendor> getPaginatedList(Pageable pageable){
		
		return vendorRepository.findAll(pageable);
	}

	@Override
	public Vendor findByVendorId(int vendorId) {
		return vendorRepository.findById(vendorId).get();
	}
	
}
