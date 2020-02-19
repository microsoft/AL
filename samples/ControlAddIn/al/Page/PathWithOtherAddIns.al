page 50304 PageWithOtherAddIns
{
    PageType = Card;

    layout
    {
        area(content)
        {
            usercontrol(PageReady; "Microsoft.Dynamics.Nav.Client.PageReady")
            {
                trigger AddInReady()
                begin
                    Message('Page ready');
                end;
            }

            //testing compilation only
            usercontrol(SocialListening; "Microsoft.Dynamics.Nav.Client.SocialListening")
            {
                trigger AddInReady();
                begin
                    CurrPage.SocialListening.ShowMessage('Hello');
                    CurrPage.SocialListening.ShowWidget('https://wikipedia.org');
                    CurrPage.SocialListening.DetermineUserAuthentication('https://wikipedia.org');
                end;

                trigger DetermineUserAuthenticationResult(result: Integer)
                begin
                end;

                trigger MessageLinkClick(identifier: Integer)
                begin
                end;
            }
        }
    }
}