codeunit 50131 TextBuilderCode
{
    trigger OnRun();
    var
        Builder: codeunit MarkdownWriter;
        Download: codeunit DownloadHelper;
    begin
        HelloWorld(Builder);
        WhatABeautifulDay(Builder);

        Builder.Replace('day', 'week');

        Message(Builder.ToText());

        Download.DownloadTextToClient('Greetings.md', Builder.ToText());
    end;

    local procedure HelloWorld(Builder: codeunit MarkdownWriter);
    begin
        Builder.AppendHeadingLine('Hello World');
    end;

    local procedure WhatABeautifulDay(Builder: codeunit MarkdownWriter);
    begin
        Builder.AppendBold('What a beautiful day');
    end;
}