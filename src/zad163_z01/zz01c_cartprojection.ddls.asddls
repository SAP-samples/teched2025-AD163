@Metadata.allowExtensions: true
define root view entity ZZ01C_CartProjection
  provider contract transactional_query
  as projection on ZZ01R_Cart
{
  key OrderUuid,
      Currency,
      Notes,
      OrderID,
      RequestDeliveryDate,
      TotalPrice,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      _Items : redirected to composition child ZZ01C_ItemProjection
}
