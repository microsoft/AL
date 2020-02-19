codeunit 50132 XmlCode
{
    trigger OnRun();
    var
        Document: XmlDocument;
        Node: XmlNode;
        nodeList: XmlNodeList;
        Download: codeunit DownloadHelper;
    begin
        Document := CreateBooks();

        // Show the document
        Message(Format(Document));

        Download.DownloadTextToClient('books.xml', Format(Document));
    end;

    local procedure CreateBooks(): XmlDocument;
    var
        Document: XmlDocument;
        Node: XmlNode;
    begin
        Document.Add(
            XmlElement.Create('books', 'http://www.contoso.com/books',
                CreateBook('Pride And Prejudice', 24.95, 'novel', '1-861001-57-8'),
                CreateBook('The Handmaid''s Tale', 29.95, 'novel', '1-861002-30-1'),
                CreateBook('Sense and Sensibility', 19.95, 'novel', '1-861001-45-3')));

        exit(Document);
    end;

    local procedure CreateBook(Title: Text; Price: Decimal; Genre: Text; ISBN: Text) Element: XmlElement;
    begin
        Element := XmlElement.Create('book',
            XmlElement.Create('title', XmlText.Create(Title)),
            XmlElement.Create('price', XmlText.Create(Format(Price))));

        Element.Attributes.Set('genre', Genre);
        Element.Attributes.Set('ISBN', ISBN);
    end;
}
