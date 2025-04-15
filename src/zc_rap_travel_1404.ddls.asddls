@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO projection'
 @Search.searchable: true
 @Metadata.allowExtensions: true
define root  view entity zc_rap_travel_1404
  provider contract transactional_query 
 as projection on zi_rap_travel_1404
{
    key TravelUuid,
    @Search.defaultSearchElement: true
    TravelId,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_AGENCY', element: 'AgencyID'} }]
    @ObjectModel.text.element: ['AgencyName']
    @Search.defaultSearchElement: true
    AgencyId,
    _Agency.Name as AgencyName,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['CustomerName']
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
    CurrencyCode,
    Description,
    TravelStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zc_rap_booking_1404,
    _Currency,
    _Customer
}
