function CallJavaScript(i, s, d, c) {    
    var div = document.querySelectorAll(".cb")[0];
    div.innerText = ['Received from AL:', i, s, d, c].join(' ');
}