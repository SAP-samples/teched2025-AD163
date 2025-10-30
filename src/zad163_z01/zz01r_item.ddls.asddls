@Metadata.allowExtensions: true
@EndUserText.label: 'ZZ01R_Item'
define view entity ZZ01R_Item
  as select from ZZ01ITEM
  association to parent ZZ01R_Cart as _Parent on _Parent.OrderUuid = $projection.ParentUuid
{
  @EndUserText.label: 'ID'
  @Semantics.uuid: true
  key ITEM_UUID as ItemUuid,
  @EndUserText.label: 'Currency'
  CURRENCY as Currency,
  @EndUserText.label: 'ItemID'
  ITEM_ID as ItemID,
  @EndUserText.label: 'ItemPrice'
  @Semantics.amount: {
    currencyCode: 'Currency'
  }
  ITEM_PRICE as ItemPrice,
  @EndUserText.label: 'ItemUnitPrice'
  @Semantics.amount: {
    currencyCode: 'Currency'
  }
  ITEM_UNIT_PRICE as ItemUnitPrice,
  @EndUserText.label: 'OrderedItem'
  ORDERED_ITEM as OrderedItem,
  @EndUserText.label: 'ParentUuid'
  PARENT_UUID as ParentUuid,
  @EndUserText.label: 'Quantity'
  QUANTITY as Quantity,
  _Parent
}
