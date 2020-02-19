codeunit 50133 DictionaryCode
{
    trigger OnRun();
    var
        Dict: Dictionary of [Char, Text];
    begin
        Dict.Add('A', 'Alligator');
        Dict.Add('B', 'Bear');
        Dict.Add('C', 'Crocodile');
        Dict.Add('D', 'Dog');
        Dict.Add('E', 'Elephant');

        Message('Animal starting with letter ''C'': ' + Dict.Get('C'));
    end;
}