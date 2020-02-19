codeunit 50129 DownloadHelper
{
    procedure DownloadTextToClient(Filename: Text; s: Text);
    var
        Stream: InStream;
        BlobRec: record TempBlob;
    begin
        if Confirm('Download ' + Filename) then begin
            BlobRec.WriteAsText(s, TextEncoding::UTF8);
            BlobRec.Blob.CreateInStream(Stream);
            DownloadFromStream(Stream, '', '', '', Filename);
        end;
    end;
}