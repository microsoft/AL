var container = document.querySelectorAll("#controlAddIn")[0];

function addText(text) {
    var p = document.createElement("p");
    p.innerText = text;
    container.appendChild(p);
}

function addImage(){
    var imageUrl = Microsoft.Dynamics.NAV.GetImageResource('./images/logo.png');
    var img = document.createElement("img");
    img.src = imageUrl;
    img.width = 216;
    img.height = 46;
    container.appendChild(img);
}

function addDiv(cls){
    var div = document.createElement("div");
    div.className = cls;
    container.appendChild(div);
    return div;
}

function addButton(){
    var button = document.createElement("button");
    button.innerText = "Click me";
    button.addEventListener("click", function() {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Callback', [42, 'some text', 5.8, 'c']);
    });
    container.appendChild(button);
}

addText("- The box below should have bisque background from css");
addDiv("bg");

addText("- There should be an image below with Microsoft logo (using image API)");
addImage();

addText("- Same image should be below (using relative image location in CSS)");
addDiv("div-with-image");

addText("- Invoke CallJavaScript page action to call JS");
var div = addDiv("cb");
div.innerText = "Results will appear here";

addText("- This button should call AL");
addButton();

addText("- Check the same add-in on customer card");