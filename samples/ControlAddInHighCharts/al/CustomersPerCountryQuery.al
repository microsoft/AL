query 50201 CustomersPerCountryQuery
{
    elements
    {
        dataitem(Customer; Customer)
        {
            column(CountryRegionCode; "Country/Region Code") { }
            column(CustomerCount)
            {
                Method = Count;
            }
        }
    }
}