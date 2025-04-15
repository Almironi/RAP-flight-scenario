@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking BO projection view'
 @Search.searchable: true
 @Metadata.allowExtensions: true
define view entity zc_rap_booking_1404 as projection on zi_rap_booking_1404
{
    key BookingUuid,
    TravelUuid,
    @Search.defaultSearchElement: true
    BookingId,
    BookingDate,
    @Search.defaultSearchElement: true
    @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
    @ObjectModel.text.element: ['CustomerName']
    CustomerId,
    _Customer.LastName as CustomerName,
    @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
    @ObjectModel.text.element: ['CarrierName']
    CarrierId,
    _Carrier.Name      as CarrierName,
     @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                            additionalBinding: [ { localElement: 'CarrierID',    element: 'AirlineID' },
                                                                 { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                                                 { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
    CurrencyCode,
    CreatedBy,
    LastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _Carrier,
    _Connection,
    _Currency,
    _Customer,
    _Flight,
    _Travel : redirected to parent zc_rap_travel_1404
}
