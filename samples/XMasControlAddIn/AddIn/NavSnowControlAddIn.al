controladdin NavSnowControlAddIn
{
    RequestedHeight = 300;    
    RequestedWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =         
        'http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js',
        'js/main.js';
    StyleSheets =
        'css/main.css';
    StartupScript = 'js/create.js';
    event OnControlAddInReady();
    procedure CreateUi(text : Text);
    procedure UpdateText(text : Text);
}