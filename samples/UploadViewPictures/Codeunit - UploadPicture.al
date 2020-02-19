codeunit 70000044 UploadPicture
{
    trigger OnRun();    
    var 
        fileContent : InStream;
        filename : Text;
        picturesTable : record Pictures;
    begin        
        File.UploadIntoStream('Select a picture to upload', 'c:\', 'All files (*.*)|*.*', filename, fileContent);
        picturesTable.Init();
        picturesTable.Picture.ImportStream(fileContent, filename);
        picturesTable.Insert(true);
    end;
}