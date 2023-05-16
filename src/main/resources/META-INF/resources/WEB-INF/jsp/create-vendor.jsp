<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
 <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Welcome Page</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd;">
	  <div class="container-fluid">
	    <a class="navbar-brand h1" href="#">Business Name</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	      <div class="navbar-nav">
	        <a class="nav-link active" aria-current="page" href="/">Home</a>
	        <a class="nav-link" href="/vendor-list?page=0">Vendor List</a>
	        <a class="nav-link" href="/create-vendor">Create Vendor</a>
	      </div>
	    </div>
	   
	  </div>
	</nav>
	<c:if test="${not empty msg}" >
		<div class="alert alert-primary d-flex align-items-center" role="alert">
		  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
		    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
		  </svg>
		  <div>
		    There is no Vendor Available to show. Create vendor first!
		  </div>
		</div>
	</c:if>
	
	<!-- This is vendor details form -->
	
	<div class="container-sm " >
		<form:form cssClass="row g-3" method="POST" modelAttribute="vendor" >
			 <form:hidden path="vendorId"/>
			  <div class="col-md-6">
			    <label for="vendorName" class="form-label">Vendor Name</label>
			    <form:input type="text" path="vendorName" required="required" class="form-control" id="vendorName" />
			  </div>
			 
			  <div class="col-md-6">
			    <label for="bankAcountNo" class="form-label">Bank Acount No.</label>
			    <form:input type="text" path="bankAccountNumber"  required="required" class="form-control" id="bankAcountNo" />
			    <form:errors class="text-danger" path="bankAccountNumber" />
			  </div>
			  
			  <div class="col-md-6">
			    <label for="bankName" class="form-label">Bank Name</label>
			    <form:input type="text" path="bankName" required="required" class="form-control" id="bankName"/>
			  </div>
			  
			  <div class="col-12">
			    <label for="inputAddress" class="form-label">Address Line 1</label>
			    <form:input type="text" path="address1" class="form-control" id="inputAddress" placeholder="1234 Main St"/>
			  </div>
			  <div class="col-12">
			    <label for="inputAddress2" class="form-label">Address Line 2</label>
			    <form:input type="text" path="address2" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor"/>
			  </div>
			  <div class="col-md-4">
			    <label for="inputCity" class="form-label">City</label>
			    <form:input type="text"  path="city" class="form-control" id="inputCity"/>
			  </div>
			  <div class="col-md-4">
			    <label for="inputState" class="form-label">State</label>
			    <form:input type="text" path="state" class="form-control" id="inputstate"/>
			    <!-- <select id="inputState" class="form-select">
			      <option selected>Choose...</option>
			      <option>...</option>
			    </select> -->
			  </div>
			  <div class="col-md-4">
			    <label for="inputCountry" class="form-label">Country</label>
			    <form:input type="text" path="country" class="form-control" id="inputCountry"/>
			  </div>
			  <div class="col-md-2">
			    <label for="inputZip" class="form-label">Zip</label>
			    <form:input type="text" path="zipCode" class="form-control" id="inputZip"/>
			  </div>
			  
			  <!-- <div class="col-12">
			    <div class="form-check">
			      <input class="form-check-input" type="checkbox" id="gridCheck">
			      <label class="form-check-label" for="gridCheck">
			        Check me out
			      </label>
			    </div>
			  </div> -->
			  <div class="col-12">
			    <button type="submit" class="btn btn-success">Save Vendor</button>
		  </div>
	</form:form>
	</div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>