pageextension 50130 BusinessManagerRoleCenterExt extends "Business Manager Role Center"
{
    actions
    {
        addafter(Reports)
        {
            group(DotnetReplace)
            {
                Caption = '.net Replacements';

                action(Json)
                {
                    ApplicationArea = All;
                    Caption = 'Json Test';
                    Image = Document;
                    RunObject = codeunit JsonCode;
                }
                action(Xml)
                {
                    ApplicationArea = All;
                    Caption = 'Xml Test';
                    Image = XMLFile;
                    RunObject = codeunit XmlCode;
                }
                action(TextBuilder)
                {
                    ApplicationArea = All;
                    Caption = 'TextBuilder Test';
                    Image = Text;
                    RunObject = codeunit TextBuilderCode;
                }
                action(Dictionary)
                {
                    ApplicationArea = All;
                    Caption = 'Dictionary Test';
                    Image = BulletList;
                    RunObject = codeunit DictionaryCode;
                }
            }
        }
    }
}