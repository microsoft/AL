page 50301 PageWithWebPageViewer
{
    PageType = Card;

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                usercontrol(Test; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        Message('Ready %1', callbackUrl);
                    end;

                    trigger DocumentReady()
                    begin
                        Message('Document ready');
                    end;

                    trigger Refresh(callbackUrl: Text)
                    begin
                        // Called only on control add-in re-creation
                        Message('Refresh %1', callbackUrl);
                    end;

                    trigger Callback(data: Text)
                    begin
                        // Hard to test since it requires event messaging with another secure page
                        Message('Callback %1', data);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Navigate)
            {
                trigger OnAction();
                begin
                    CurrPage.Test.Navigate('https://wikipedia.org');
                end;
            }
            action("Set ratio")
            {
                trigger OnAction();
                begin
                    CurrPage.Test.InitializeIFrame('16:9');
                    CurrPage.Test.Navigate('https://wikipedia.org');
                end;
            }
            action("Set html")
            {
                trigger OnAction();
                begin
                    CurrPage.Test.SetContent('<div style="width: 100px; height: 100px; background: red">Do you see a red box?</div>');
                end;
            }
            action("Set html and js")
            {
                trigger OnAction();
                begin
                    CurrPage.Test.SetContent('<div style="width: 100px; height: 100px; background: lime">Message should have appeared as well</div>', 'alert("You should see a lime box")');
                end;
            }
            action("Links in new window")
            {
                trigger OnAction();
                begin
                    CurrPage.Test.LinksOpenInNewWindow();
                    CurrPage.Test.SetContent('<a href="https://bing.com">Click me</a>');
                end;
            }
        }
    }

    procedure TestOthers()
    begin
        //Theses things are hard to test, so just checking correct signatures.
        CurrPage.Test.Navigate('https://wikipedia.org', 'POST', '{"test": 1}');
        CurrPage.Test.SubscribeToEvent('test', '*');
        CurrPage.Test.InvokeEvent('data');
        CurrPage.Test.PostMessage('Hello', '*', false);
    end;
}