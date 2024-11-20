<cfcomponent >
   <cffunction name="createContact" access="public" returntype="boolean" >
      <cfargument name="title" type="string" required="true">
      <cfargument name="firstName" type="string" required="true"> 
      <cfargument name="lastName" type="string" required="true"> 
      <cfargument name="gender" type="string" required="true"> 
      <cfargument name="dateOfBirth" type="string" required="true">
      <cfargument name="photo" type="string" required="true">
      <cfargument name="Address" type="string" required="true">
      <cfargument name="street" type="string" required="true">
      <cfargument name="district" type="string" required="true">
      <cfargument name="state" type="string" required="true">
      <cfargument name="nationality" type="string" required="true">
      <cfargument name="pinCode" type="string" required="true">
      <cfargument name="email" type="string" required="true">
      <cfargument name="phone" type="string" required="true">
   
      <cftry>
         <cfquery name="insertContact" datasource="#application.datasource#">
            INSERT INTO Contact(title,firstName,lastName,gender,dateOfBirth,photo,Address,street,district,state,nationality,pinCode,emailId,phoneNumber,_createdBy,_updatedBy) VALUES (
               <cfqueryparam value="#arguments.title#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.firstName#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.lastName#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.gender#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.dateOfBirth#" cfsqltype="date">,
               <cfqueryparam value="#arguments.photo#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.Address#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.street#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.district#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.state#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.nationality#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.pinCode#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.email#" cfsqltype="varchar">,
               <cfqueryparam value="#arguments.phone#" cfsqltype="varchar">,
               <cfqueryparam value="#session.userName#" cfsqltype="varchar">,
               <cfqueryparam value="#session.userName#" cfsqltype="varchar">
            )                     
         </cfquery>
      <cfcatch type="any">
         <cfreturn false>               
      </cfcatch>
    </cftry>
      <cfreturn true>
   </cffunction>

   <cffunction name="fetchContacts" access="public" returntype="query">
      <cftry>
         <cfquery name="getContacts" datasource="#application.datasource#">
            SELECT contactId,title,firstName,lastName,gender,dateOfBirth,photo,Address,street,district,state,nationality,pinCode,emailId,phoneNumber FROM Contact                     
         </cfquery>
      <cfcatch type="any">                        
      </cfcatch>              
      </cftry>
      <cfreturn getContacts>
   </cffunction>

   <cffunction name="fetchSingleContact" access="remote" returntype="struct" returnformat="JSON">
      <cfargument name="contactId" type="string" required="true">
      <cfset local.structContact = structNew()>
      <cfquery name="fetchAcontact" datasource="#application.datasource#">
         SELECT contactId,title,firstName,lastName,gender,dateOfBirth,photo,Address,street,district,state,nationality,pinCode,emailId,phoneNumber from Contact WHERE contactId = <cfqueryparam value="#arguments.contactId#">
      </cfquery>       
       <cfset var colname = "">            
       <cfloop list="#fetchAcontact.columnList#" index="colname">
          <cfset "structContact.#colname#" = fetchAcontact[colname][1]>
       </cfloop>
       <cfset local.structContact["dateOfBirth"] = dateFormat(fetchAcontact.dateOfBirth,"dd-mm-yyy")>
      <cfreturn local.structContact>
   </cffunction>

   <cffunction name="deleteContact" access="remote" returntype="any">
      
      <cfargument name="contactId" type="string" required="true">
      
      <cfquery name="deleteContact" datasource="#application.datasource#">
         DELETE FROM Contact WHERE contactId = <cfqueryparam value="#arguments.contactId#" cfsqltype="varchar">               
      </cfquery>
      <cfreturn "methodreturned">
   </cffunction>
</cfcomponent>