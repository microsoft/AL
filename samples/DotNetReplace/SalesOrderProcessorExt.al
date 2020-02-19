pageextension 50131 OrderProcessorRoleCenterExt extends "Order Processor Role Center"
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
                    Caption = 'Json Test';
                    Image = Document;
                    RunObject = codeunit JsonCode;
                }
                action(Xml)
                {
                    Caption = 'Xml Test';
                    Image = XMLFile;
                    RunObject = codeunit XmlCode;
                }
                action(TextBuilder)
                {
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