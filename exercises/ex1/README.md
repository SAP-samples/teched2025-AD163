[Home - AD163](/README.md#exercises)

# Exercise 1: Start your development by creating an ABAP project in the SAP Build Lobby

## Introduction

In this exercise, you will setup your _ABAP development project_ in the _SAP Build Lobby_. The _ABAP development project_ links your ABAP development package and the modelling file - that both reside in the ABAP stack - with SAP Business Application Studio. Inside SAP Business Business Application Studio all development artefacts are stored inside the so called <img src="images/DevSpaceIcon.png" alt="create dialog" width="7%"> Dev Space.  
_SAP Build Lobby_ is the starting point to manage your different Build project types, from ABAP to CAP.

> **Reminder:**   
> Don't forget to replace all occurences of the placeholder **`###`** with your Group ID in the exercise steps below.   
> The password will be provided by the course instructors. 

 Your Group ID starts with a location specific character **A** for ASUG, **B** for TechEd Berln, ...
 
 In addition you have to add the last two digits of the number at your desk **##**.
 
 So depending on the event you are participating your Group ID will look like follows:   

 | **Event name**                          | **Group ID** (location specific)                  |  System |
 |----------------------------------------|---------------------------------|---------------------------------            
| **ASUG TechConnect in Louisville**       | **A##**                                |    |
| **SAP TechEd Berlin**                    | **B##**                                |    |
| **TechEd On Tour - Bangalore 2025**      | **C##**                                |    |
| **TechEd On Tour - Sydney 2025**         | **D##**                                |    |

## Exercise: Create an ABAP Project

[^Top of page](#)

1. In your browser, sign in to the Build lobby with the credentials of your exercise group.  

> The URL and the username and the password will be provided to you by the course instructors.
> The URL to the SAP Build Lobby is provided as a shortened URL in a format such as https://url.sap/abc123.

2. Add the shortened URL for the SAP Build Lobby into your browser.

3. When being prompted enter the credentials:

   - email: `AD163-###@....`
   - password: `xxxx`

   ⚠️⚠️⚠️ Be sure to replace the placeholder `###` with the correct group id. (`A##` for ASUG, `B##` for SAP Teched, ...) 

   <img src="images/00_010_initial_authentication.png" alt="create dialog" width="25%">

4. In the SAP Build Lobby, click on **Create** right above the project list and select **Create** from the drop-down list. 

   <img src="images/01_015_SAP_Build_Lobby.png" alt="create dialog" width="100%">  

   This opens the Create Project dialog.     
  
5. In the **Create Project** dialog, select **Application** and click **Next**

   <img src="images/01_020_SAP_Build_Lobby_create_application.png" alt="create dialog" width="100%">   

6. As **Category** select **Full-Stack** and advance with **Next**. 
   
   <img src="images/01_030_Create_project_category.png" alt="create project category" width="100%">   

7. Finally select **Full-Stack ABAP (SAP Business Application Studio)** and advance with **Next**.

   <img src="images/01_040_Create_project_type.png" alt="create dialog" width="100%">

8. In the **System and Package** dialog, maintain the required information as follows:  

   > ℹ️ ** Replace **`###`** with the Group ID of your exercise group.  
   > For the screenshots in this exercise we used the suffix **`Z01`**. Please DO NOT use **`Z01`**.  
   
   As **System** select **H63** from the drop down box.   
   For **Package** select **Existing** and enter **ZAD163_###**.    
  
   > Please note:  
   > The package with your group ID `###` has been pre-created for your convenience.  
 
   Advance with **Next**.
   
   <img src="images/01_050_select_system_and_package.png" alt="system and package" width="100%">

9. In the **Transport Request** dialogue create a new transport request.   

   <img src="images/01_060_create_new_transport.png" alt="system and package" width="100%">

10. In the **Name** dialog, maintain the following values:
   - Name: **ZAD163_###**
   - Description: **Project for ZAD163_###**
   - CSN File Name: **ZAD163_###**
   - Dev Space: **ZAD163###**

   <img src="images/01_070_create_sap_build_project_and_dev_space.png" alt="project name" width="100%">

   Advance to reviewing your information with **Review**.

   > The **CSN File** is a JSON file that is used by the graphical modeller (that we will use later to model our RAP business object).
   It is stored as a repository object of type **R3TR CSNM** in the ABAP stack and the name must therefore start with `Z` or with a customer or partner specific namespace `/<namespace>/`.  
   > In addition you have to select a name for a Dev Space that will be used by SAP Build Code. Since the Dev Space `ZAD163_###` does not exist yet, it will be created and started. The startup of the Dev Space will take some time as a new runtime environment will be instantiated in SAP Build.   
   > Please be aware that only up to two Dev Space may be active in parallel for each user and that only up to 10 Dev Spaces maybe created for each user.  

11. Review your selections and inputs. Make sure you replaced **###** with your exercise Group ID. Finish the project setup with **Create**.

12. In the project list you can now see the newly created project **ZAD163_###**. Be patient in as long in the **Versions** column you see the status **Pending Creation**. 


    <img src="images/01_080_create_sap_build_project_pending_creation.png" alt="project name" width="100%">   

   
13. Once the **Versions** column is empty the project has been created and the SAP Build Code Dev Space has been started.   

      <img src="images/01_090_project_created.png" alt="project name" width="100%">

You can now click on the project name to open SAP Build.

> Hint: **Dev Space Manager**  
> When clicking on the bento menu (Japanese Burger Menu 😉) you can start several tools such as the **Dev Space Manager**:    
> <img src="images/01_100_dev_space_manager.png" alt="project name" width="100%">    
> Using the Dev Space Manager you can check the status of your Dev Space.     
> <img src="images/01_110_dev_space_manager.png" alt="project name" width="100%">   


## Summary & Next Exercise
[^Top of page](#)

Now that you've... 
- created an ABAP project in the lobby of SAP Build,
- and created a new CSN file that will contain the data created by the graphical CDS modeler that will be used in the following exercise

you can continue with the next exercise in the Business Application Studio - **[Exercise 2: Create a Shopping Cart business object, projection and service with the graphical modeler in SAP Build Code](../ex2/README.md)**.

## License

Copyright (c) 2024 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
