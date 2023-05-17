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
    <nav class="navbar navbar-expand-lg navbar-light mb-3 " style="background-color: #e3f2fd;">
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
	
	<div class="container">
	<a class="btn btn-outline-success btn-lg" href="/create-vendor">Create Vendor</a>
		<table class="table table-hover ">
		  <thead>
		    <tr>
		      <th scope="col">S. No</th>
		      <th scope="col">Vendor Name</th>
		      <th scope="col">Bank Account No.</th>
		      <th scope="col">Bank Name</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${vendors.content }" var="vendor" varStatus="i">
		  
		    <tr >
		      <th scope="row">${(currentPage * 10)+i.index+1}</th>
		      <th scope="row">${vendor.vendorName}</th>
		      <td>${vendor.bankAccountNumber}</td>
		      <td>${vendor.bankName}</td>
		      <td><a href="update-vendor?vendorId=${vendor.vendorId}&page=${currentPage}" class="btn btn-success">EDIT</a></td>
		      <td><a href="delete-vendor?vendorId=${vendor.vendorId}" onclick="return confirmDelete()" class="btn btn-danger">DELETE</a></td>
		    </tr>
		    
		  </c:forEach>
		    
		  </tbody>
	</table>	
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  <c:if test="${currentPage > 0}">
	    <li class="page-item"><a class="page-link" href="vendor-list?page=${currentPage - 1}">Previous</a></li>
	  </c:if>
	   		<c:forEach var="i" begin="0" end="${totalPages-1}">
	    		<li class="page-item"><a class="page-link" href="vendor-list?page=${i}">${i+1}</a></li>
	   		</c:forEach>
	   	
	   	<c:if test="${currentPage+1 < totalPages}">
	    	<li class="page-item"><a class="page-link" href="vendor-list?page=${currentPage + 1}">Next</a></li>
	    </c:if>
	  </ul>
	</nav>
	</div>
	
	<c:set var="page" scope="session" value="${totalPages}" />
	
	<script type="text/javascript">
	 function confirmDelete(){
		 return confirm("Are you Sure You want to delete this Vendor?");
	 }
	
	</script>
	
	
	<!-- 
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalToggleLabel">Confirm to Delete</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       	Are you sure you want to Delete This Vendor Details.
			      </div>
			      <div class="modal-footer">
			      	<a href="delete-vendor?vendorId=${vendor.vendorId}" class="btn btn-danger">Confirm</a>
			      	<a class="btn btn-warning" data-bs-toggle="modal" href="#exampleModalToggle" role="button">
			      </div>
			    </div>
			  </div>
			</div>
	
	 -->

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