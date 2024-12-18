<!DOCTYPE html>
<cfset local.cntDatabaseObj = createObject("component","components.contactDatabaseOperations")>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	  <link rel="stylesheet" href="./style/home.css">
</head>
<body>
	<cfoutput>		
	 <header>
      <div class="headerItem1">
         <img src="./Images/Capture.PNG" alt="logo" height="63">
         <div class="headerItem1Text">
            ADDRESS BOOK
         </div>
      </div>
      <div class="headerItem2">
      	<div class="headerItem2_log1">
      	    <i class="fa-solid fa-right-from-bracket"></i>
      	    <span>Logout</span>
      	</div>         
      </div>
   </header>	
	<main>
		<div class="exportOption">
			<img src="./Images/pdf.png" alt="pdf" width="36">
			<img src="./Images/excel.png" alt="excel" width="36">
			<img src="./Images/printer.png" alt="printer" width="36">
		</div>
		<div class="contact_profileContainer">
			<div class="profileContainer d-flex flex-column align-items-center">								
				<img src="#session.profilePhoto#" alt="profilepic" width="100">
				<div class="profileName">#session.fullName#</div>
				<button class="createCntBtn" data-bs-toggle="modal" data-bs-target="##exampleModal" type="button">CREATE CONTACT</button>
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form method="POST" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="mainContainer d-flex">
									<div class="formContainer w-80 d-flex flex-column">										
											<div class="createContactText">CREATE CONTACT</div>
											<div class="personalCntText">Personal Contact</div>										
											<table class="personalCntTable">
												<tr>
													<th class="required">Title</th>
													<th class="required">First Name</th>
													<th class="required">Last Name</th>											
												</tr>
												<tr>
													<td>
														<select name="title" id="title">
															<option value="Mr">Mr</option>
															<option value="Miss">Miss</option>
															<option value="Mrs">Mrs</option>													
														</select>												
													</td>
													<td>
														<input type="text" name="firstName" id="firstName" placeholder="Your First Name">												
													</td>
													<td>
														<input type="text" name="lastName" id="lastName" placeholder="Your Last Name">												
													</td>											
												</tr>
												<tr>
													<th class="required" colspan="2">Gender</th>		
													<th class="required">Date of Birth</th>									
												</tr>
												<tr>
													<td colspan="2">
														<input type="text" name="gender" id="gender" placeholder="Your Gender">												
													</td>
													<td>
														<input type="date" name="dob" id="dob">												
													</td>											
												</tr>
											</table>
											<label for="photo">Upload Photo</label>
											<input type="file" name="photo" id="photo" class="inputPhoto">
											<div class="cntDetailsText">Contact Details</div>
											<table class="personalCntTable">
												<tr>
													<th class="required">Address</th>
													<th class="required">Street</th>
												</tr>
												<tr>
													<td>
														<input type="text" name="address" id="address" placeholder="Your Address">
													</td>
													<td>
														<input type="text" name="street" id="street" placeholder="Your Street">
													</td>
												</tr>
												<tr>
													<th class="required">District</th>
													<th class="required">State</th>
												</tr>
												<tr>
													<td>
														<input type="text" name="district" id="district" placeholder="Your District">
													</td>
													<td>
														<input type="text" name="state" id="state" placeholder="Your State">
													</td>
												</tr>
												<tr>
													<th class="required">Nationality</th>
													<th class="required">Pincode</th>
												</tr>
												<tr>
													<td>
														<input type="text" name="nationality" id="nationality" placeholder="Your Nationality">
													</td>
													<td>
														<input type="text" name="pincode" id="pincode" placeholder="Your Pincode">
													</td>
												</tr>
												<tr>
													<th class="required">Email Id</th>
													<th class="required">Phone Number</th>
												</tr>
												<tr>
													<td>
														<input type="email" name="email" id="email" placeholder="Your Email">
													</td>
													<td>
														<input type="text" name="phone" id="phone" placeholder="Your Phone Number">
													</td>
												</tr>
											</table>										
										</div>
									<div class="profileIconContainer d-flex justify-content-center align-items-start">
										<img src="./Images/profile.png" alt="profile" width="90">									
									</div>							
								</div>						
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary" id="submit" name="submit">Create</button>
							</div>							
						</div>
						</form>
					</div>
				</div>
				<!--- view modal --->
				<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">							
							<div class="modal-body">
								<div class="mainContainer d-flex">
									<div class="formContainer w-80 d-flex flex-column">										
										<div class="createContactText">CONTACT DETAILS</div>
										<div>
											<div>
											<span>Name</span>
											<span>:</span>
											<span id="cntName"></span>										
										</div>
										<div>
											<span>Gender</span>
											<span>:</span>
											<span id="cntGender"></span>	
										</div>
										<div>
											<span>Date Of Birth</span>
											<span>:</span>
											<span id="cntDob"></span>	
										</div>
										<div>
											<span>Address</span>
											<span>:</span>
											<span id="cntAddress"></span>	
										</div>
										<div>
											<span>Pincode</span>
											<span>:</span>
											<span id="cntPincode"></span>	
										</div>
										<div>
											<span>Email Id</span>
											<span>:</span>
											<span id="cntMail"></span>	
										</div>
										<div>
											<span>Phone</span>
											<span>:</span>
											<span id="cntPhone"></span>	
										</div>																		
									</div>												
								</div>
									<div class="profileIconContainer d-flex justify-content-center align-items-start">
										<img src="./Images/profile.png" alt="profile" width="90">									
									</div>
								</div>	
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>								
							</div>
						</div>
					</div>
				</div>
			</div>
			<cfif structKeyExists(form,"submit")>
				<cfset local.uploadRelativePath = "./Images/Uploads/">
				<cffile action="upload" destination="#expandPath(local.uploadRelativePath)#" nameconflict="makeUnique" filefield="photo" result="newPath" >
				<cfset local.imagePath = local.uploadRelativePath & #newPath.ServerFile#>				
				<cfset local.result = local.cntDatabaseObj.createContact(form.title,form.firstName,form.lastName,form.gender,form.dob,local.imagePath,form.address,form.street,form.district,form.state,form.nationality,form.pincode,form.email,form.phone)>															
			</cfif>
			<cfset local.AllContacts = local.cntDatabaseObj.fetchContacts()>	
			<div class="contactContainer">
				<table class="cntTable">															
					<tr>
						<th></th>
						<th>NAME</th>
						<th>EMAIL ID</th>
						<th>PHONE NUMBER</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<cfloop query="#local.AllContacts#">
					<tr>
						<td><img src="#local.AllContacts.photo#" alt="profile" width="70"></td>
						<td>#local.AllContacts.firstName#</td>
						<td>#local.AllContacts.emailId#</td>
						<td>#local.AllContacts.phoneNumber#</td>
						<td><button class="contactBtn">EDIT</button></td>
						<td><button class="contactBtn" onclick="deleteContact(this)" value="#local.AllContacts.contactId#">DELETE</button></td>
						<td><button class="contactBtn" data-bs-toggle="modal" data-bs-target="##exampleModal2" value="#local.AllContacts.contactId#" onclick="viewData(this)">VIEW</button></td>
					</tr>
					</cfloop>
				</table>
			</div>
		</div>		
	</main>
	</cfoutput>
	<script src="./script/script.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
</body>
</html>