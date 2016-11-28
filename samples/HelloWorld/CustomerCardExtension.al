pageextension 70000021 CustomerCardExtension extends "Customer Card"
{

    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Customer")
        {   
            action("Show Greeting")
            {
                RunObject = codeunit HelloWorld;
                RunPageOnRec = True;
                Image = CheckDuplicates;
                PromotedCategory = Category8;
                Promoted = true;
            }
        }
    }    
}
