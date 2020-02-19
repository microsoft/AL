page 70000005 ShowPictures
{
    SourceTable = Pictures;
    PageType = List;

    layout
    {
        area(Content)
        {
            repeater(Pics)
            {
                field(Id; Id) { }
                field(PicSomething; Picture)
                {
                    ShowCaption = false;
                }
            }
        }
    }
}