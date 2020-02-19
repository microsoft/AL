window.chart = new Highcharts.Chart({
    chart: {
        renderTo: 'controlAddIn',
        borderWidth: 0,
        type: 'pie'
    },

    title: {
        text: 'Customers per country'
    },

    plotOptions: {
        pie: {
            innerSize: 100,
            depth: 45,
            events: {
                click: function(event) {
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CountryClicked', [{code: event.point.name, value: event.point.y}]);
                }
            }
        },
    },


    series: [{
        name: 'Customers count',
        data: [],
    }],

    credits: {
        enabled: false
    }
});