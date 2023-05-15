package com.gk.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gk.model.Vendor;

public interface VendorRepository extends JpaRepository<Vendor, Integer> {

	public Page<Vendor> findAll(Pageable pageable);
}
