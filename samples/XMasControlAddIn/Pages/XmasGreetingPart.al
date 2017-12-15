page 50101 XmasGreetingPart
{
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            usercontrol(SnowControl;NavSnowControlAddIn)
            {
                trigger OnControlAddInReady();
                begin                        
                    CurrPage.SnowControl.CreateUi(CurrentText);
                    ControlIsReady := true;
                end;
            }
            
        }
    }

    var
      CurrentText: Text;
      ControlIsReady: Boolean;

    procedure SetText(NewText: Text)
    begin        
        CurrentText := NewText;
        if ControlIsReady then
          CurrPage.SnowControl.UpdateText(CurrentText);
    end;

}