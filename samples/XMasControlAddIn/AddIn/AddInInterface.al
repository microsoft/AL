controladdin NavSnowControlAddIn
{
    RequestedHeight = 300;    
    RequestedWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =         
        'AddIn/jquery.min.js',
        'AddIn/main.js';
    StyleSheets =
        'AddIn/main.css';
    StartupScript = 'AddIn/create.js';
    event OnControlAddInReady();
    procedure CreateUi(text : Text);
    procedure UpdateText(text : Text);
}