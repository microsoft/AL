codeunit 50128 MarkdownWriter
{
    var
        Builder: TextBuilder;

    procedure AppendHeadingLine(Heading: Text);
    begin
        Builder.Append('# ');
        Builder.AppendLine(Heading);
    end;

    procedure Append(s: Text);
    begin
        Builder.Append(s);
    end;

    procedure AppendBold(s: Text);
    begin
        Builder.Append('**');
        Builder.Append(s);
        Builder.Append('**');
    end;

    procedure NewLine();
    begin
        Builder.AppendLine();
    end;

    procedure Replace(Old: Text; New: Text);
    begin
        Builder.Replace(Old, New);
    end;

    procedure ToText(): Text;
    begin
        exit(Builder.ToText);
    end;

}