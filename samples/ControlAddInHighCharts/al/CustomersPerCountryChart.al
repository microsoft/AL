controladdin CustomersPerCountryChart
{
    Scripts = 'https://code.jquery.com/jquery-2.1.0.min.js',
              'https://code.highcharts.com/4.0.1/highcharts.js',
              'js/main.js';

    StartupScript = 'js/chart.js';

    VerticalShrink = true;
    HorizontalShrink = true;
    HorizontalStretch = true;
    VerticalStretch = true;

    procedure LoadData(Data: JsonArray);

    event CountryClicked(Country: JsonObject);
}