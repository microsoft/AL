codeunit 70051001 HelloWorld
{
    TableNo = Customer;

    trigger OnRun();
    var
        HelloText : Codeunit GreetingsManagement;
    begin
        Message(HelloText.GetRandomGreeting() + ', ' + Rec.Name);
    end;
}