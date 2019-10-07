// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

codeunit 50101 CurrencySetup
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Currency: Record Currency;
        DemoAlCurrencySetup: Record "PBT Currency Sample Setup";
        ExchangeRate: Record "Currency Exchange Rate";
    begin
        if not Currency.Get('DKK') then begin
            Currency.InitRoundingPrecision();
            Currency.Code := 'DKK';
            Currency.Description := 'Danish Kroner';
            Currency."ISO Code" := 'DKK';
            Currency."ISO Numeric Code" := '208';
            Currency.Symbol := 'kr';
            Currency.Insert(true);
        end;

        if not Currency.Get('SEK') then begin
            Currency.InitRoundingPrecision();
            Currency.Code := 'SEK';
            Currency.Description := 'Swedish Krona';
            Currency."ISO Code" := 'SEK';
            Currency."ISO Numeric Code" := '752';
            Currency.Symbol := 'kr';
            Currency.Insert(true);
        end;

        if not Currency.Get('USD') then begin
            Currency.InitRoundingPrecision();
            Currency.Code := 'USD';
            Currency.Description := 'United States Dollar';
            Currency."ISO Code" := 'USD';
            Currency."ISO Numeric Code" := '840';
            Currency.Symbol := '$';
            Currency.Insert(true);
        end;

        if not DemoAlCurrencySetup.Get('SETUP') then begin
            DemoAlCurrencySetup.Init();
            DemoAlCurrencySetup."Primary Key" := 'SETUP';
            DemoAlCurrencySetup.SleepDurationFactbox := 2000;
            DemoAlCurrencySetup.SleepDurationFactboxRepeater := 1;
            DemoAlCurrencySetup.SleepDurationRoleCenter := 2000;
            DemoAlCurrencySetup.Insert();
        end;
    end;
}