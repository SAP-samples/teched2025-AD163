@Metadata.allowExtensions: true
define view entity ZZ01C_ItemProjection
  as projection on ZZ01R_Item
{
  key ItemUuid,
      Currency,
      ItemID,
      ItemPrice,
      ItemUnitPrice,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZAD163_I_PRODUCTS', element: 'Material' },
                                              useForValidation: true,
                                              additionalBinding: [ { localElement: 'ItemUnitPrice',
                                                                     element: 'Price',
                                                                     usage: #RESULT },
                                                                   { localElement: 'Currency',
                                                                     element: 'Currency',
                                                                     usage: #RESULT } ] } ]


      OrderedItem,
      ParentUuid,
      Quantity,
      _Parent : redirected to parent ZZ01C_CartProjection
}
