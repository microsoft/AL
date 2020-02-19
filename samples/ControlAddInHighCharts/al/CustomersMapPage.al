page 50200 CustomersMapPage
{
    Caption = 'Customer Map';
    Description = 'Customer Map';

    layout
    {
        area(Content)
        {
            usercontrol(ControlName; CustomersPerCountryChart)
            {
                trigger CountryClicked(Country: JsonObject)
                var
                    CountryCode: JsonToken;
                    CustomerCount: JsonToken;
                begin
                    Country.Get('code', CountryCode);
                    Country.Get('value', CustomerCount);
                    Message('Country: %1, Customers: %2', CountryCode, CustomerCount);
                end;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(LoadData)
            {
                ApplicationArea = All;
                Caption = 'Load data';

                trigger OnAction();
                var
                    Data: JsonArray;
                begin
                    Data := CustomersPerCountryToJson();
                    CurrPage.ControlName.LoadData(Data);
                end;
            }
        }
    }

    local procedure CustomersPerCountryToJson() Result: JsonArray
    var
        CustomersQuery: query CustomersPerCountryQuery;
        JObject: JsonObject;
    begin
        CustomersQuery.Open();
        while CustomersQuery.Read() do begin
            JObject := QueryRecordToJson(CustomersQuery);
            Result.Add(JObject);
        end;
    end;

    local procedure QueryRecordToJson(var Q: Query CustomersPerCountryQuery) Result: JsonObject
    begin
        Result.Add('code', Q.CountryRegionCode);
        Result.Add('value', Q.CustomerCount);
    end;
}