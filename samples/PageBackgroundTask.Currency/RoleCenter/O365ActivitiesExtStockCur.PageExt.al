// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

pageextension 50100 "O365 Activities Ext Currency" extends "O365 Activities"
{
    layout
    {
        addafter("Overdue Purch. Invoice Amount")
        {
            field("EUR/DKK"; EURDKK)
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                DrillDownPageID = "Currencies";
                Caption = 'EUR/DKK - Latest';
                ToolTip = 'Latest EUR/DKK rate from the market';

                trigger OnDrillDown()
                begin
                    DrillDownToCurrency('EUR');
                end;
            }

            field("EUR/USD"; EURUSD)
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                DrillDownPageID = "Currencies";
                Caption = 'EUR/USD - Latest';
                ToolTip = 'Latest EUR/USD rate from the market';

                trigger OnDrillDown()
                begin
                    DrillDownToCurrency('EUR');
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        PbtParameters: Dictionary of [Text, Text];
        DemoAlCurrencySetup: Record "PBT Currency Sample Setup";
    begin
        if (PbtTaskId = 0) then begin
            PbtParameters.Set('Date', 'latest');
            PbtParameters.Set('CurrencyBase', 'EUR');
            PbtParameters.Set('Currencies', 'USD,DKK');
            DemoAlCurrencySetup.Get('SETUP');
            PbtParameters.Set('SleepSimulation', Format(DemoAlCurrencySetup.SleepDurationRoleCenter)); // Delay to simulate a slow HTTP call

            // Testability
            OnBeforePageBackgroundTaskSchedule(PbtParameters);

            CurrPage.EnqueueBackgroundTask(PbtTaskId, Codeunit::CurrencyRetriever, PbtParameters, 100000, PageBackgroundTaskErrorLevel::Warning);
        end;
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = PbtTaskId) then begin
            Evaluate(EURDKK, Results.Get('DKK'));
            Evaluate(EURUSD, Results.Get('USD'));
        end;
    end;

    local procedure DrillDownToCurrency(Code: Code[10])
    var
        Currency: Record Currency;
    begin
        Currency.Get(Code);
        Page.Run(Page::Currencies, Currency);
    end;

    // For testability of the page.
    [IntegrationEvent(false, false)]
    local procedure OnBeforePageBackgroundTaskSchedule(var PbtParameters: Dictionary of [Text, Text])
    begin
    end;

    var
        EURDKK: Decimal;
        EURUSD: Decimal;
        EURSEK: Decimal;
        PbtTaskId: Integer;
        MockHttpResponse: Text;
}
