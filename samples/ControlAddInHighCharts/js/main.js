function LoadData(data) {
    chart.series[0].setData(data.map(x => [x.code, x.value]));
}