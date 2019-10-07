// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

pageextension 50101 "Currencies PageExt" extends Currencies
{
    layout
    {
        addlast(factboxes)
        {
            part("Latest rates"; "Latest Rates Factbox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = Code = FIELD(Code);
            }

            part("Latest rates repeater"; "Latest Rates Factbox wRepeater")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    // For a factbox with a repeater, we must update it's content on the main page.
    // For the factbox without a repeater, the content is updated inside the factbox.
    trigger OnAfterGetCurrRecord()
    var
        PbtParameters: Dictionary of [Text, Text];
        Currency: Record Currency;
        CurrenciesToRetrieve: Text;
        DemoAlCurrencySetup: Record "PBT Currency Sample Setup";
    begin
        if (PbtTaskId <> 0) then begin
            // Reseting PbtTaskId to 0, to make sure that the completion trigger will not display data for the wrong record.
            PbtTaskId := 0;
        end;

        CurrPage."Latest rates repeater".Page.ResetTempTable(Code);
        if (Code = '') then
            exit;

        Currency.SetFilter(Code, '<>' + Code);
        if Currency.FindSet then begin
            repeat
                CurrenciesToRetrieve += Currency.Code + ',';
            until Currency.Next = 0;
        end;
        CurrenciesToRetrieve := CurrenciesToRetrieve.TrimEnd(',');

        PbtParameters.Set('Date', 'latest');
        PbtParameters.Set('CurrencyBase', Code);
        PbtParameters.Set('Currencies', CurrenciesToRetrieve);
        DemoAlCurrencySetup.Get('SETUP');
        PbtParameters.Set('SleepSimulation', Format(DemoAlCurrencySetup.SleepDurationFactboxRepeater)); // Delay to simulate a slow HTTP call

        // Testability
        OnBeforePageBackgroundTaskSchedule(PbtParameters);

        // Default timeout is 2min, max is 10min.
        CurrPage.EnqueueBackgroundTask(PbtTaskId, Codeunit::CurrencyRetriever, PbtParameters, 100000, PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = PbtTaskId) then begin
            // Adding the current currency as 0 (so it looks better)
            Results.Set(Code, '1.0');
            CurrPage."Latest rates repeater".Page.InitTempTable(Results);
        end;
    end;

    // For testability of the page.
    [IntegrationEvent(false, false)]
    local procedure OnBeforePageBackgroundTaskSchedule(var PbtParameters: Dictionary of [Text, Text])
    begin
    end;

    var
        PbtTaskId: Integer;
}

