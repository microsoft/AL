codeunit 50130 JsonCode
{
    trigger OnRun();
    var
        JObject: JsonObject;
        Download: codeunit DownloadHelper;
    begin
        JObject := CreateBooks();

        Message(Format(JObject));

        Download.DownloadTextToClient('books.json', Format(JObject));
    end;

    local procedure CreateBooks() JObject: JsonObject;
    var
        JArray: JsonArray;
    begin
        JArray.Add(CreateBook('Pride And Prejudice', 24.95, 'novel', '1-861001-57-8'));
        JArray.Add(CreateBook('The Handmaid''s Tale', 29.95, 'novel', '1-861002-30-1'));
        JArray.Add(CreateBook('Sense and Sensibility', 19.95, 'novel', '1-861001-45-3'));

        JObject.Add('books', JArray);
    end;

    local procedure CreateBook(Title: Text; Price: Decimal; Genre: Text; ISBN: Text) JObject: JsonObject;
    begin
        JObject.Add('title', Title);
        JObject.Add('price', Format(Price));
        JObject.Add('genre', Genre);
        JObject.Add('ISBN', ISBN);
    end;
}