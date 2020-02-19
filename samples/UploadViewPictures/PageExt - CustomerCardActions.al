pageextension 70000007 CustomerCardPictures extends "Customer Card" 
{
    actions 
    {
        addfirst(Creation) 
        {
            action(Upload) 
            {
                Caption = 'Upload a picture';
                RunObject = codeunit UploadPicture;
            }
            action(View) 
            {
                Caption = 'View uploaded pictures';
                RunObject = page ShowPictures;
                RunPageOnRec = false;
            }        
        }
    }    
}