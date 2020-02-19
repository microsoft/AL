controladdin TestAddIn
{
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.2/knockout-debug.js',
                './js/main.js';

    StartupScript = 'js/startup.js';

    StyleSheets = 'css/skins.css';

    Images = './images/logo.png';

    RequestedHeight = 500;
    MinimumHeight = 500;
    VerticalShrink = false;
    HorizontalStretch = true;

    procedure CallJavaScript(i : integer; s: text; d : decimal; c : char);

    event Callback(i : integer; s: text; d : decimal; c : char);
}