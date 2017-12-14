// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50101 CustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part(SnowPart; "X-mas Greeting Part")
            { 
              Caption='X-mas';
            }
        }

    }
    var XMasGreeting: Label 'Happy Christmas, %1';

    trigger OnAfterGetCurrRecord();
    begin
        CurrPage.SnowPart.Page.SetText(StrSubstNo(XMasGreeting, Name));
    end;
}