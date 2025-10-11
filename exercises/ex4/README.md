[Home - AD163](/README.md#exercises)

# Exercise 4: Create, preview and adapt a SAP Fiori elements application

## Introduction

In this exercise, you will create a SAP Fiori elements application project based on the service created in the previous exercise. To verify the created application you will preview the application in the development environment. Finally you will add capabilities to your SAP Fiori UI that cannot be configured by using backend annotations alone. 

### Exercises
<!-- 
- [4.1 - Create the application](#exercise-41-)
- [4.2 - Preview the application](#exercise-42-)
- [4.2 - Adapt the application](#exercise-43-)
- [Summary & Next Exercise](#summary--next-exercise)  
-->
> **Reminder:**   
> Don't forget to replace all occurences of the placeholder **`###`** with your suffix or Group ID in the exercise steps below.   
> You can use the ADT function **Replace All** (**Ctrl+F**) for the purpose.   
> If you haven't been assigned a Group ID, select a combination of three (3) numbers and/or letters, such as e.g. **`A00`** or **`C56`**.  

## Exercise 4.1: Create the application

1. In the Storyboard click on `+` under **UI Applications**
![Start SAP Fiori generator](./Images/01.png)
   
2. Business Application Studio opens the **SAP Fiori Generator** with the **Template Selection** screen
    - Select **List Report Page**
    - Press **Next >**

3. The **Data Source and Service Selection** screen is pre-filled. Press **Next>**
   
5. In the **Entity Selection** screen the `CartProjection` is pre-selected as the **Main Entity**. We keep the other values' defaults. Press **Next>**
    ![Maint entity selection](./Images/02.png)  

6. In the **Project Attributes** enter the following values and press **Next >**.  

     > Hint: Your **Module Name** must be in lowercase letters.

     - Module Name: `AD163U###`
     - Application Title: `ShoppingCart App AD163U###`
     - Description: `A Fiori application`
     - Enable TypeScript: `No`
     - Add deployment configuration: `Yes`
     - Add FLP configuration: `Yes`
     - Use virtual endpoints for local preview `Yes`   
     - Configure advanced options: `No`

     ![Project Attributes](./Images/03.png)

7. In the **Deployment Configuration** enter the following values and press **Next >**.

     > Hint: Your **SAP UI5 ABAP Repository** name must start with `Z` (or with a namespace if you would use your own system) because this is an ABAP repository object.  

    - Target: `ABAP`      
    - Destination: `<your_TechED system>` (_pre_filled_)
    - SAP UI5 ABAP Repository: `ZAD163U###`
    - Package: `ZAD163U###`
    - Transport Request: `Create During Deployment`
    - 
     ![Deployment Configuration](./Images/04.png)   

8. In the **Fiori Launchpad Configuration** screen enter the following values and press **Finish**  

    - Semantic Object: `ZAD163U###`
    - Action: `display`
    - Title: `ShoppingCart App AD163U###`

    ![Fiori Launchpad configuration](./Images/05.png)

9. At this point the the creation of the app is in prgress, which can take a few moments, and once finshed the **Application Information** page opens automatically.

## Exercise 4.2: Preview the application

1. On the **Application Information** page select **Preview Application**  

   >**Hint.** You can open the Application Information also through the menu > View > Command Palette > search and select Application Information.

   ![Application Information Preview](./Images/06.png)  

2. From the **Preview Options** select the third entry **start-mock** to preview the app with mock data.

   ![Application Information Preview](./Images/07.png) 

3. A popup might show up telling you that a service is listening on port 8080.  

   ![Application Information Preview](./Images/08.png) 

4. When the browser opens, press **Go**. Then click on an entry in the list.

   ![Application Information Preview](./Images/09.png)

5. When you have clicked on an entry in the list the content of your screen will be replaced by showing the details of that entry in the object page.  

   ![Detail page](./Images/10.png)

6. Keep the preview running for the next exercise, you can take out the browser tab as a new window to the side of your screen.

## Exercise 4.3: Adapt the application

After having created a SAP Fiori list report application that is so far completely driven by annotations provided by the RAP business object in the backend we will now perform two changes to the UI that can only be adapted by modifying the **manifest.json** file of your project.  

- Choose the **Flexible Column Layout** which allows the user to see more details on the screen.
- Enable **Initial Load**, that data is loaded automatically, so that you don't have to press the **Go** button.   

We will not do that manually but using the **SAP Fiori tools** for these tasks.

1. On the **Application Information** page select **Open Page Map** 

![Open Page map](./Images/11.png) 

2. Change the layout from **Standard Layout** to **Flexible Column Layout**

![Page Map Flexible Column Layout](./Images/12.png) 

3. Open the **Edit** mode of the **List Report**   

![List Report Overview](./Images/13.png) 

4. Select the **Table**

![List Report Table](./Images/14.png) 

5. Enable **Initial Load**, that data is loaded automatically. Maybe you need to scroll the menu a bit down to see **Initial Load**

>**Hint.** You can also use the search filter option on the top right of the Page Editor to find a desired property.

![List Report Table](./Images/15.png)

6. We are done with the adaptations of the Fiori Elements UI. Now we can close the Page Map.

![Close Page Map](./Images/16.png)

 

[^Top of page](#)
