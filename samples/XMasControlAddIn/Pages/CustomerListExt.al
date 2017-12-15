pageextension 50101 CustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part(SnowPart; XmasGreetingPart)
            { 
              Caption='Christmas Greeting';
            }
        }

    }
    var XMasGreeting: Label 'Happy Christmas, %1';

    trigger OnAfterGetCurrRecord();
    begin
        CurrPage.SnowPart.Page.SetText(StrSubstNo(XMasGreeting, Name));
    end;
}