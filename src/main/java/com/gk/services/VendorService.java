package com.gk.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.gk.model.Vendor;

public interface VendorService {

	public void saveVendor(Vendor vendor);
	public List<Vendor> getAllVendor();
	public void deleteByVendorId(int vendorId);
	public Vendor findByVendorId(int vendorId);
	public Vendor findByBankAccountNumber(String accountNumber);
	public void updateVendor(Vendor vendor);
	public Page<Vendor> getPaginatedList(Pageable pageable);
}
