package com.gk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gk.model.Vendor;
import com.gk.services.VendorServices;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class VendorController {
	
	private final VendorServices vendorServices;
	
	
	@Autowired
	private VendorController(VendorServices vendorServices) {
		super();
		this.vendorServices = vendorServices;
	}

	// to show welcome page or view 
	@GetMapping(value = {"/","/home"})
	public String gotoWelcomePage() {
		return "welcome";
	}
	
	// maps the view of vendor creation to this url with vendor object as attribute
	@RequestMapping(value="/create-vendor", method = RequestMethod.GET)
	public String gotoVendorCreatePage(ModelMap model) {
		model.put("vendor", new Vendor());
		return "create-vendor";
	}
	
	// takes the form data submitted on '/create-vendor' as post method request 
	// and stores vendor details to database
	@RequestMapping(value="/create-vendor", method = RequestMethod.POST)
	public String createAndSaveVendor(ModelMap model,@Valid Vendor vendor, BindingResult result) {
		if(vendorServices.findByBankAccountNumber(vendor.getBankAccountNumber()) != null) {
			model.put("error", "true");
			return "create-vendor";
		}
		if(result.hasErrors()) {
			return "create-vendor";
		}
		vendorServices.saveVendor(vendor);
		return "redirect:vendor-list?page=0";
	}
	
	// shows the vendors list on bellow url 
	@GetMapping("/vendor-list")
	public String showAllVendors(@RequestParam Integer page, ModelMap model) {
		
		Pageable pageable = PageRequest.of(page, 10);
		
		Page<Vendor> vendors = vendorServices.getPaginatedList(pageable);
		int totalPages = vendors.getTotalPages();
		
		if(totalPages < 1) {
			model.put("vendor", new Vendor());
			model.put("msg", "true");
			return "redirect:create-vendor";
		}
		model.put("vendors", vendors);	// sublist of vendor objects as one page
		model.put("currentPage", page);		//current page no.
		model.put("totalPages", totalPages);	// total pages 
		return "view-all-vendors";
	}
	
	@RequestMapping(value="/delete-vendor", method = RequestMethod.GET)
	public String deleteVenodorInList(@RequestParam int vendorId,ModelMap model) {
		vendorServices.deleteByVendorId(vendorId);
		return "redirect:vendor-list?page=0";
	}
	
	@RequestMapping(value="/update-vendor", method = RequestMethod.GET)
	public String showUpdateVendorPage(@RequestParam("vendorId") int vendorId,@RequestParam("page") Integer page,ModelMap model) {
		
		Vendor vendor = vendorServices.findByVendorId(vendorId);
		model.put("vendor", vendor);
		model.put("page", page);
		return "update-vendor";
	}
	
	@RequestMapping(value="/update-vendor", method = RequestMethod.POST)
	public String updateVendor(ModelMap model,@Valid Vendor vendor, BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return "update-vendor";
		}
		vendorServices.deleteByVendorId(vendor.getVendorId());
		vendorServices.saveVendor(vendor);
		// if want to go to last page then we can use this
//		int page = (int)session.getAttribute("page"); 
		
		return "redirect:vendor-list?page=0";
	}
	
	
	
}
