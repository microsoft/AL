page 50303 PageWithVideoPlayer
{
    PageType = Card;

    layout
    {
        area(content)
        {
            usercontrol(Player; "Microsoft.Dynamics.Nav.Client.VideoPlayer")
            {
                trigger AddInReady();
                begin
                    CurrPage.Player.SetWidth(640);
                    CurrPage.Player.SetHeight(480);
                    CurrPage.Player.SetFrameAttribute('src', 'https://www.youtube.com/embed/nqM79hlHuOs');
                end;
            }
        }
    }
}