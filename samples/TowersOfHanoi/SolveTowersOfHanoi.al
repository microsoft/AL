codeunit 70000600 SolveTowersOfHanoi 
{
    var
        TowerTooBigErr : Label 'Maximum Tower size is %1';

    procedure Solve(var Rec : record TowerTable; NoOfDiscs : Integer);
    begin
        if NoOfDiscs > MaxStrLen(Rec.TowerA) then
            Error(TowerTooBigErr, MaxStrLen(Rec.TowerA));

        Rec.DeleteAll;
        Initialize(Rec, NoOfDiscs);
        Move(Rec, NoOfDiscs, Rec.TowerA, Rec.TowerC, Rec.TowerB);        
    end;

    local procedure Initialize(var rec : record TowerTable; NoOFDiscs : Integer);
    var
        i : Integer;
    begin
        Rec.Step := 1;
        for i := NoOFDiscs downto 1 do
            Rec.TowerA := Rec.TowerA + Format(i);
        Rec.Insert();
    end; 

    local procedure Move(var r : record TowerTable; n : integer; var source : Text[10]; var target : text[10]; var aux : text[10]);
    begin
        if n > 0 then
        begin
           Move(r, n - 1, source, aux, target);

           target := target + source[StrLen(source)];
           source := CopyStr(source, 1, StrLen(source) - 1);

           r.Step := r.Step + 1;
           r.Insert();

           Move(r, n - 1, aux, target, source);
        end;
    end;
}