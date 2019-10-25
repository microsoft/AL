// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

codeunit 50130 CurrencyRetrieverTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestOnRun()
    var
        // To run the background code unit, any page can be used.
        PbtTestPage: TestPage "O365 Address";
        PbtParameters: Dictionary of [Text, Text];
        PbtResults: Dictionary of [Text, Text];
        Err: Label 'Expected \%1, Actual: \%2';
    begin
        // Arrange
        // TestPage.RunPageBackgroundTask requires a page to be opened.
        PbtTestPage.OpenView();

        PbtParameters.Set('Date', '2019-09-04');
        PbtParameters.Set('CurrencyBase', 'EUR');
        PbtParameters.Set('Currencies', 'DKK,SEK,USD');
        PbtParameters.Set('MockHttpResponse', '{"rates":{"USD":1.0938,"SEK":10.6598,"DKK":7.4643},"base":"EUR","date":"2019-09-26"}');

        // Act
        PbtResults := pbtTestPage.RunPageBackgroundTask(Codeunit::CurrencyRetriever, PbtParameters);

        // Assert
        ArePbtResultEqual(1.0938, pbtResults.Get('USD'), 'USD');
        ArePbtResultEqual(10.6598, pbtResults.Get('SEK'), 'SEK');
        ArePbtResultEqual(7.4643, pbtResults.Get('DKK'), 'DKK');
    end;

    local procedure ArePbtResultEqual(Expected: Decimal; Actual: Text; Msg: Text)
    var
        actualValue: Decimal;
        AreEqualFailedMsg: Label 'Assert.AreEqual failed. Expected:<%1>. Actual:<%2>. %3.', Locked = true;
    begin
        Evaluate(actualValue, Actual);

        if Expected <> actualValue then
            Error(AreEqualFailedMsg, Expected, Actual, Msg)
    end;
}