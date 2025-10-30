@Metadata.allowExtensions: true
@EndUserText.label: 'ShoppingCart'
define root view entity ZZ01R_Cart
  as select from zz01cart
  composition [0..*] of ZZ01R_Item as _Items
{
  @EndUserText.label: 'OrderUuid'
  @Semantics.uuid: true
  key order_uuid as OrderUuid,
  @EndUserText.label: 'Currency'
  currency as Currency,
  @EndUserText.label: 'Notes'
  notes as Notes,
  @EndUserText.label: 'OrderID'
  order_id as OrderID,
  @EndUserText.label: 'RequestDeliveryDate'
  request_delivery_date as RequestDeliveryDate,
  @EndUserText.label: 'TotalPrice'
  @Semantics.amount: {
    currencyCode: 'Currency'
  }
  total_price as TotalPrice,
    local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  _Items
}
