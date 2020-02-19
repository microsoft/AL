page 50305 CashFlowChartV2
{
    layout
    {
        area(Content)
        {
            usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                trigger AddInReady()
                begin
                    UpdateChart();
                end;

                trigger DataPointClicked(point: JsonObject)
                var
                    Measures: JsonToken;
                    Measure: JsonToken;
                    XValueString: JsonToken;
                    YValues: JsonToken;
                    YValue: JsonToken;
                begin
                    point.Get('Measures', Measures);
                    Measures.AsArray().Get(0, Measure);

                    point.Get('XValueString', XValueString);

                    point.Get('YValues', YValues);
                    YValues.AsArray().Get(0, YValue);

                    BusinessChartBuffer.SetDrillDownIndexesByCoordinate(
                        Measure.AsValue().AsText(),
                        XValueString.AsValue().AsText(),
                        YValue.AsValue().AsDecimal());

                    DemoCashFlowChartMgt.OnDataPointClicked(BusinessChartBuffer);
                end;
            }
        }
    }

    var
        BusinessChartBuffer: Record "Business Chart Buffer";
        DemoCashFlowChartMgt: Codeunit "Demo Cash Flow Chart Mgt. V2";

    local procedure UpdateChart();
    begin
        DemoCashFlowChartMgt.GenerateData(BusinessChartBuffer);
        BusinessChartBuffer.Update(CurrPage.Chart);
    end;
}

codeunit 50306 "Demo Cash Flow Chart Mgt. V2"
{
    var
        TextCust: Label 'Accounts Receivable';
        TextVend: Label 'Accounts Payable';
        TextBank: Label 'Bank Balances';
        TextTotal: Label 'Forecasted Balance';
        TextCredit: Label 'Credit Limit in Banks';
        TextDate: Label 'Date';

    procedure GenerateData(var BusChartBuf: Record 485);
    var
        i: Integer;
        BankBalance: Decimal;
        CustNetChange: Decimal;
        VendNetChange: Decimal;
        TotalBalance: Decimal;
        BalanceDate: Date;
        BankCreditLimit: Decimal;
    begin
        with BusChartBuf do begin
            //Initialize;
            AddMeasure(TextCust, 1, "Data Type"::Decimal, "Chart Type"::StackedColumn);
            AddMeasure(TextVend, 2, "Data Type"::Decimal, "Chart Type"::StackedColumn);
            AddMeasure(TextTotal, 3, "Data Type"::Decimal, "Chart Type"::Line);
            AddMeasure(TextCredit, 4, "Data Type"::Decimal, "Chart Type"::StepLine);
            SetXAxis(TextDate, "Data Type"::DateTime);
            BalanceDate := WORKDATE - 1; // demo. Should be TODAY.
            CalcBankBalance(BalanceDate, TotalBalance, BankCreditLimit);
            FOR i := 1 TO 20 do begin
                CustNetChange := CalcCustNetChange(BalanceDate, BalanceDate);
                VendNetChange := CalcVendNetChange(BalanceDate, BalanceDate);
                TotalBalance := TotalBalance + CustNetChange + VendNetChange;
                AddColumn(BalanceDate);  // X-Axis value
                SetValueByIndex(1 - 1, i - 1, CustNetChange); // zero indexed.
                SetValueByIndex(2 - 1, i - 1, VendNetChange);
                SetValueByIndex(3 - 1, i - 1, TotalBalance);
                SetValueByIndex(4 - 1, i - 1, BankCreditLimit);
                BalanceDate := BalanceDate + 1;
            end;
        end;
    end;

    procedure OnDataPointClicked(var BusChartBuf: Record "Business Chart Buffer");
    var
        VendLedgEntry: Record 25;
        DrillDownDate: Date;
    begin
        DrillDownDate := WORKDATE + BusChartBuf."Drill-Down X Index" + 1; // ref. first balance date in GenerateData function
        case BusChartBuf."Drill-Down Measure Index" + 1 of
            1: // Customer
                DrillDownCust(DrillDownDate);
            2: // Vendor
                DrillDownVend(DrillDownDate);
            4: // Bank Credit limits
                DrillDownBank;
        end;
    end;

    local procedure CalcCustNetChange(FromDate: Date; ToDate: Date): Decimal;
    var
        CustLedgEntry: Record 21;
        TotalRemainingAmount: Decimal;
    begin
        with CustLedgEntry do begin
            SetCurrentKey(Open, "Due Date");
            SetRange(Open, TRUE);
            SetRange("Due Date", FromDate, ToDate);
            if Find('-') then
                repeat
                    CALCFIELDS("Remaining Amt. (LCY)");
                    TotalRemainingAmount := TotalRemainingAmount + "Remaining Amt. (LCY)";
                until NEXT = 0;
        end;
        exit(TotalRemainingAmount);
    end;

    local procedure CalcVendNetChange(FromDate: Date; ToDate: Date): Decimal;
    var
        VendLedgEntry: Record 25;
        TotalRemainingAmount: Decimal;
    begin
        with VendLedgEntry do begin
            SetCurrentKey(Open, "Due Date");
            SetRange(Open, TRUE);
            SetRange("Due Date", FromDate, ToDate);
            if Find('-') then
                repeat
                    CALCFIELDS("Remaining Amt. (LCY)");
                    TotalRemainingAmount := TotalRemainingAmount + "Remaining Amt. (LCY)";
                until NEXT = 0;
        end;
        exit(TotalRemainingAmount);
    end;

    local procedure CalcBankBalance(EndDate: Date; var TotalBalance: Decimal; var BankCreditLimit: Decimal);
    var
        BankAcc: Record 270;
    begin
        with BankAcc do begin
            SETFILTER("Date Filter", '..%1', EndDate);
            if Find('-') then
                repeat
                    CALCFIELDS("Balance at Date (LCY)");
                    TotalBalance := TotalBalance + "Balance at Date (LCY)";
                    BankCreditLimit := BankCreditLimit + BankAcc."Min. Balance";
                until NEXT = 0;
        end;
    end;

    local procedure DrillDownCust(DrillDownDate: Date);
    var
        CustLedgEntry: Record 21;
    begin
        CustLedgEntry.SetRange(Open, TRUE);
        CustLedgEntry.SetRange("Due Date", DrillDownDate, DrillDownDate);
        PAGE.RUNMODAL(PAGE::"Customer Ledger Entries", CustLedgEntry);
    end;

    local procedure DrillDownVend(DrillDownDate: Date);
    var
        VendLedgEntry: Record 25;
    begin
        VendLedgEntry.SetRange(Open, TRUE);
        VendLedgEntry.SetRange("Due Date", DrillDownDate, DrillDownDate);
        PAGE.RUNMODAL(PAGE::"Vendor Ledger Entries", VendLedgEntry);
    end;

    local procedure DrillDownBank();
    begin
        PAGE.RUNMODAL(PAGE::"Bank Account List");
    end;
}