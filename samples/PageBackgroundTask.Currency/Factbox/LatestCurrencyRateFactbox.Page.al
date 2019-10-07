// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

page 50104 "Latest Rates Factbox"
{
    SourceTable = Currency;
    PageType = ListPart;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    LinksAllowed = false;
    Editable = false;
    RefreshOnActivate = false;


    Caption = 'Latest currency rates';

    layout
    {
        area(Content)
        {
            field("USD"; UsdRate)
            {
                ApplicationArea = All;
                DecimalPlaces = 5;
            }

            field("EUR"; EurRate)
            {
                ApplicationArea = All;
                DecimalPlaces = 5;
            }

            field("DKK"; DkkRate)
            {
                ApplicationArea = All;
                DecimalPlaces = 5;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        PbtParameters: Dictionary of [Text, Text];
        DemoAlCurrencySetup: Record "PBT Currency Sample Setup";
    begin
        PbtParameters.Set('Date', 'latest');
        PbtParameters.Set('CurrencyBase', Code);
        PbtParameters.Set('Currencies', 'USD,EUR,DKK');
        if (Code = 'EUR') then
            PbtParameters.Set('Currencies', 'DKK,USD');
        if (Code = 'DKK') then
            PbtParameters.Set('Currencies', 'EUR,USD');
        if (Code = 'USD') then
            PbtParameters.Set('Currencies', 'EUR,DKK');

        DemoAlCurrencySetup.Get('SETUP');
        PbtParameters.Set('SleepSimulation', Format(DemoAlCurrencySetup.SleepDurationFactbox)); // Delay to simulate a slow HTTP call

        // Testability
        OnBeforePageBackgroundTaskSchedule(PbtParameters);

        CurrPage.EnqueueBackgroundTask(PbtTaskId, Codeunit::CurrencyRetriever, PbtParameters, 100000, PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = PbtTaskId) then begin
            if Results.ContainsKey('USD') then
                Evaluate(UsdRate, Results.Get('USD'))
            else
                UsdRate := 1;

            if Results.ContainsKey('EUR') then
                Evaluate(EurRate, Results.Get('EUR'))
            else
                EurRate := 1;

            if Results.ContainsKey('DKK') then
                Evaluate(DkkRate, Results.Get('DKK'))
            else
                DkkRate := 1;
        end;
    end;

    // For testability of the page.
    [IntegrationEvent(false, false)]
    local procedure OnBeforePageBackgroundTaskSchedule(var PbtParameters: Dictionary of [Text, Text])
    begin
    end;

    var
        PbtTaskId: Integer;
        UsdRate: Decimal;
        EurRate: Decimal;
        DkkRate: Decimal;
}