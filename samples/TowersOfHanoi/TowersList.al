page 70008000 TowersList
{
    PageType=List;
    SourceTable=TowerTable;
    SourceTableTemporary = true;
    Editable  = true;

    layout
    {
        area(content)
        {
            group(Configuration)
            {
                field(NoOfDiscs;NoOfDiscs) 
                {
                    Caption = 'No of Discs';
                }
            }
            group(Solution)
            {
                repeater(Steps) 
                {
                    field(Step;Step) 
                    {
                        Editable = false;
                    }
                    field(TowerA;TowerA) 
                    {
                        Editable = false;
                    }
                    field(TowerB;TowerB) 
                    {
                        Editable = false;
                    }
                    field(TowerC;TowerC) 
                    {
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SolveIt)
            {
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = New;

                trigger OnAction();
                var
                    Solve : codeunit SolveTowersOfHanoi;
                begin
                    Solve.Solve(Rec, NoOfDiscs);
                end;
            }
        }
    }

    var
        NoOfDiscs : Integer;

    trigger OnInit();
    begin
        NoOfDiscs := 5;
    end;
}
