package com.gk.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Size;

@Entity
public class Vendor {
	@Id
	@GeneratedValue
	private int vendorId;
	@Size(max=100, message = "Name must be less than 100 characters")
	private String vendorName;
	@Size(min = 8,max =16, message = "Account Number should between 8 to 16 digits")
	private String bankAccountNumber;
	private String bankName;
	@Size(max=100, message = "address must be less than 100 characters")
	private String address1;
	@Size(max=100, message = "address must be less than 100 characters")
	private String address2;
	@Size(max=100, message = "must be less than 100 characters")
	private String city;
	@Size(max=100, message = "must be less than 100 characters")
	private String state;
	@Size(max=100, message = "must be less than 100 characters")
	private String country;
	@Size(max=10, message = "must be less than 10 characters")
	private String zipCode;
	
	
	public Vendor() {
		
	}

	

	public Vendor(String vendorName, String bankAccountNumber, String bankName, String address1, String address2,
			String city, String state, String country, String zipCode) {
		super();
		
		this.vendorName = vendorName;
		this.bankAccountNumber = bankAccountNumber;
		this.bankName = bankName;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipCode = zipCode;
	}
	





	public int getVendorId() {
		return vendorId;
	}



	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}



	public String getVendorName() {
		return vendorName;
	}


	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}


	public String getBankAccountNumber() {
		return bankAccountNumber;
	}


	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	@Override
	public String toString() {
		return "Vendor [vendorName=" + vendorName + ", bankAccountNumber=" + bankAccountNumber + ", bankName="
				+ bankName + ", address1=" + address1 + ", address2=" + address2 + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", zipCode=" + zipCode + "]";
	}
	
	
	
	
	
	

}
