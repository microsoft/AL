// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

// Codeunit for creating random greetings
codeunit 70051100 GreetingsManagement
{
    var
        GreetingsList: temporary Record "Standart Text";
        GreetingsCount: Integer;

    // Get a translated 'Hello World' string.
    // Thanks to https://www.bing.com/translator/
    local procedure GetHelloWorldText(GreetingNo : Integer) : Text;
    begin
        if not GreetingsList.Get(format(GreetingNo)) then
            exit('Hello, World'); // Default to the good old one.
        exit(GreetingsList.Description);
    end;

    local procedure AddGreetingToList(language: Text; greetingText: Text)
    begin
        GreetingsCount += 1;
        GreetingsList.Code := format(GreetingsCount);
        GreetingsList.Description := strsubstno('%1: %2', language, greetingText);
        GreetingsList.Insert;        
    end;

    local procedure CreateGreetingsList()
    begin
        GreetingsList.DeleteAll;
        GreetingsCount := 0;
        AddGreetingToList('Arabic', 'مرحبا بالعالم');
        AddGreetingToList('Bulgarian', 'Здравей, свят');
        AddGreetingToList('Cantonese', '世界你好');
        AddGreetingToList('Greek', 'Γεια σου κόσμε');
        AddGreetingToList('Korean', '전 세계 여러분 안녕하세요');
        AddGreetingToList('Thai', 'หวัดดีชาวโลก');
        AddGreetingToList('Hindi', 'हैलो वर्ल्ड');
        AddGreetingToList('Japanese', 'ハローワールド'); 
        AddGreetingToList('Danish', 'Hej verden');
        AddGreetingToList('Polish', 'Witaj świecie');
        AddGreetingToList('Pig Latin', 'Ellohay Orldway');
        AddGreetingToList('Hungarian', 'Szia, világ!');
        AddGreetingToList('Flemish', 'Hej wereld');
        AddGreetingToList('Dutch', 'Hallo wereld');
        AddGreetingToList('French', 'Bonjour le monde');
        AddGreetingToList('Finnish', 'Hei maailma');
        AddGreetingToList('Russian', 'Привет, мир!');
        AddGreetingToList('Czech', 'Ahoj světe');            
        AddGreetingToList('German', 'Hallo Welt');
        AddGreetingToList('Lithuanian', 'Labas, pasauli!');  
        AddGreetingToList('Afrikaans', 'Hallo wêreld');
        AddGreetingToList('Bakke Snavvendt', 'Wello Horld');                  
    end;
   
    // Gets a random greeting.
    procedure GetRandomGreeting() : Text;
    begin
        Randomize;
        CreateGreetingsList;
        exit(GetHelloWorldText(Random(GreetingsCount)));  // Random(int) is 1-based
    end;
}
