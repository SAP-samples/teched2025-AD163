[Home - AD163](/README.md#exercises)

# Exercise 2: Create a Shopping Cart business object, projection and service with the Graphical Modeler in SAP Build Code

## Introduction

In this exercise, you will create a shopping cart business model with two entities, ...

### Exercises

- [Model the Shopping Cart Business Object](#exercise-model-the-shopping-cart-business-object)
- [Model the Shopping Cart Projection](#exercise-model-the-shopping-cart-projection)
- [Model the Shopping Cart Service](#exercise-model-the-shopping-cart-service)
- [Generate the RAP service](#exercise-generate-the-rap-service)
- [Summary & Next Exercise](#summary--next-exercise)  


> **Reminder:**   
> Don't forget to replace all occurences of the placeholder **`###`** with your suffix or Group ID in the exercise steps below.

## Exercise: Sign in to SAP Build Code and open the SAP Build Code Storyboard
[^Top of page](#)

1. As you have opened SAP Build Code in your browser by clicking on the newly created project name in the previous exercise, logon with the credentials given for your exercise group. This opens the SAP Build Code Storyboard with your project.

  <img src="images/p201.png" alt="storyboard" width="100%">

2. Open the Business Objects modeler view by clicking **+** under **Create an entity**.

## Exercise: Model the Shopping Cart Business Object
[^Top of page](#)

> Note: Next to the empty Business Object Modeler you can see an **ZAD163_###.abap.csn** file. This file resides on your ABAP system in the package you created in Exercise 1. This file is used by the modeler to store your model. You should not edit this file manually since this can damage the integrity of the model.

### Model the entity `Cart`

<img src="images/p202.png" alt="emptyBusinessObjectModeler" width="100%">

1. In the Business Object modeler press **Add Entity** and drag the new entity to the center of the work area. The name **Entity1** is highlighted and you can use your keyboard to input **'Cart'** right away. Else, double click on the name **Entity1** to select and change the name.

   <img src="images/g201.gif" alt="createCartEntity" width="100%">

2. Add a label for the **Cart** entity by selecting the entity with a click, then on the appearing right-side menu of the entity select **Show Details**. In the now opened details pane add **ShoppingCart** as the label.

   <img src="images/g202.gif" alt="setLabel" width="100%">

3. On the right hand side of the `Cart` entity click on the button **Set Root Entity**. 

   <img src="images/003_make_cart_root_entity.png" alt="setLabel" width="100%">

3. Add the following properties to the Cart entity. You can either edit and add properties by double-clicking the pre-generated **ID** property and changing it's values. Add a new property from there by hitting enter once you are done editing. Or add the properties via the **Properties** pane that we opened in the previous step. 

4. **OrderUUID**:
  The pre-generated **ID** is a key field already and has the right type **abap.raw(16)**. Just change the name to **OrderUUID** and press **Enter** this will create a new property below.

<img src="images/g203.gif" alt="orderUUID" width="100%">
  
5. In the newly created property field enter:  

   - **OrderID** in the **Name** field   
   - **abap.numc** in the **Type** field and  
   - **8** in the **Length** field   

  Proceed the same way for the next properties (name: type(length)):

   | **Property name**   | **Type**     |  **Length**  |   
   |---------------------|--------------|--------------|        
   | RequestDeliveryDate | datn         |     -        |
   | Notes               | char         |    100       |

<img src="images/g204.gif" alt="properties" width="100%">

6. **TotalPrice**  
   Add a new property. Fill **TotalPrice** for the name and select the type **curr**. This will add precision and scale fields where you enter **11** for precision and **2** for scale.  
   The property is  missing the Currency field. To create and add this open the details dialog of the property by clicking on the right-pointing arrow next to the property. Scroll down to **Currency** and enter here **Currency**. Press enter and close the dialog with **OK**. 


You are now all set with the Cart entity.

<img src="images/g205.gif" alt="currency" width="100%">

### Model the entity `Item`

1. To add the entity `Item` click **AddEntity** and change the name to **Item**.

2. Add a label for the **Item** entity by selecting the entity with a click, then on the appearing right-side menu of the entity select **Show Details**. In the now opened details pane add **ShoppingCartItem** as the label.

3. Rename the **ID** field to **ItemUUID**, leave type and lenght as given.

4. Add the following properties:

<!--
ItemID: abap.numc(8)
OrderedItem: abap.char(40)
Quantity: abap.numc(4)
ParentUUID: raw(16)
-->

 | **Property name**  | **Type**     |  **Length**  |   
 |--------------------|--------------|--------------|        
 | ItemID             | numc         |     8        |
 | OrderedItem        | char         |    40        |
 | Quantity           | numc         |    4         |
 | ParentUUID         | raw          |    16        |

> Some explanations:  
> The field `ParentUUID` is needed to store the value of the UUID based key field of the Parent Node **Cart**. Starting from the third level of a grandchild entity one would have to add a second UUID based field called `RootUUID` to store the value of the UUID based key field of the root entity. 

5. **ItemPrice**  
  Add a new property. Fill **ItemPrice** for the name and select the type **curr**. This will add precision and scale fields where you enter **11** for precision and **2** for scale.  
   The property is  missing the Currency field. To create and add this open the details dialog of the property by clicking on the right-pointing arrow **`>`**  next to the property. Scroll down to **Currency** and enter here **Currency**. Press enter and close the dialog with **OK**.   

6. **ItemUnitPrice**   
   Add a new property. Fill **ItemUnitPrice** for the name and select the type **curr**. This will add precision and scale fields where you enter **11** for precision and **2** for scale.   
   The property is missing the Currency field. To fill this open the details dialog of the property by clicking on the right-pointing arrow **`>`** and select the field **Currency** from the drop down box.  

   <img src="images/004_select_currency_for_item_unit_price.png" alt="currency" width="100%">   

### Create a composition

Create a composition relationship between **Cart** and **Item**. 

1. Select the entity **Cart** and select **Add Relationship** from the menu on the item. 
   - Now drag the relationship arrow to the **Item** entity and click to release.    
   - In the relationship dialog select **Composition** and **To-Many** .   
   - Now select in the Relationship Details for **Item** the field **ParentUUID** instead of the key field **ItemUUID**.     

   <img src="images/g206_2.gif" alt="composition" width="100%">

2. Your result should look like this:

   <img src="images/p203_2.png" alt="result" width="100%">

You can now close the Business Object Modeler and return to the storyboard.

## Exercise: Model the Shopping Cart Projection
[^Top of page](#)

1. In the storyboard click **+** under **Create a projection**.
<img src="images/p204.png" alt="createProjection" width="100%">

2. Click **Add Projection** in the Projection modeler. Drag the empty projection to the center of the screen and release.

<img src="images/g207.gif" alt="emptyprojection" width="100%">

3. Now select a base type for the projection. On the right hand side in the **Projection** pane, click the drop down and select **businessobject.Item**. Keep all properties selected and confirm to fill the projection.

<img src="images/g208.gif" alt="fillprojection" width="100%">

4. Create a second projection with **Add Projection**. This will automatically assign **businessobject.Cart** as base type. Confirm the fields in the **Projection** pane.

<img src="images/g209.gif" alt="fillprojection" width="100%">

The composition relationship was automatically created. Your result should now look like this:

<img src="images/p205.png" alt="resultProjection" width="100%">

You can now close the Projection modeler and return to the storyboard.

## Exercise: Model the Shopping Cart Service
[^Top of page](#)

1. In the storyboard click **+** under **Create a service**.

<img src="images/p206.png" alt="servicestoryboard" width="100%">

2. Create the service by clicking **Add Service** and dragging the empty service to the center of the modeler. Rename the service to **CartService**.

<img src="images/g210.gif" alt="cartService" width="100%">

3. Now add both projections to the service by selecting the service with a single click, and opening the details pane from the menu on the service. Select both entities to be part of the service and mark the `CartProjection` entity as the **Leading Entity**.  

<img src="images/g211.gif" alt="cartServiceaddprojections" width="100%">

Your resulting service should look like this:
<!--
<img src="images/p207.png" alt="resultservice" width="100%">
-->
<img src="images/p207_2.png" alt="resultservice" width="100%">

You are now all set to generate the ABAP backend artefacts from the modeled business object, projection and service. Close the service modeler and return to the storyboard.

## Shortcut in case of modelling problems

If you have not succeeded in modelling your RAP service we have provided the following shortcut.   

<details>
<summary>Click here only in case of modelling problems, otherwise proceed with generating the service</summary>

- In SAP Build click on the generated project --> BAS will be openened
- Select **Add** --> **Business Object Entity**   
- Click on **Add Entity**   
- Ignore the generated entity and click on the **Open CDS Editor (TEXT)** Icon

  ![image](./images/002_shortcut_open_csn_editor.png)

- In the new tab cut and paste the content of the following json -->
- Close the tab

- The tab with the Graphical Editor should now look like in the screen shot below

  ![image](images/002_shortcut_open_csn_editor_result.png)    

</details>

## Exercise: Generate the RAP service
[^Top of page](#)

1. To generate the ABAP backend artefacts click **Generate** on top of the storyboard.

<img src="images/p208.png" alt="storyboardgeneration" width="100%">

2. ⚠️⚠️⚠️ As the **Artifact prefix** you have to select your group ID:  

 | **Event name**                          | **Artifact Prefix**                   |  
 |----------------------------------------|---------------------------------|       
 | **ASUG TechConnect in Louisville**       | **A##**                                |     
 | **SAP TechEd Berlin**                    | **B##**                                | 

 


<img src="images/p209.png" alt="generationprefix" width="100%">

3. Click **Next** to advance. Now the generation is being validated. The validation status should be **OK** for you.

<img src="images/p210.png" alt="validation" width="100%">

4. Advance with **Next** to preview the to be generated artefacts and click **Finish** to start the generation. The generation might take a few minutes as the artefacts are being generated and activated and the service published. This enables us to add a Fiori UI from the storyboard in the following exercices.

<img src="images/p211.png" alt="preview" width="100%">

## Summary

You have used the Graphical Modeller to model in Business Application Studio (BAS) and you have generated a (read-only) RAP service. This service will be CRUD-enabled in the following exercise by adding the missing behavior definition and behavior projection.   

[^Top of page](#)

  



**[Exercise 3: Implement transactional behavior in ADT, create validations and determinations](../ex3/README.md)**.

[^Top of page](#)
