// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

codeunit 50131 O365ActivitiesExtensionTest
{
    Subtype = Test;
    TestPermissions = Disabled;
    EventSubscriberInstance = Manual;

    [Test]
    procedure TestPageExtension()
    var
        ActivitesPage: TestPage "O365 Activities";
        Err: Label 'Expected \%1, Actual: \%2';
    begin
        // Arrange
        BindSubscription(O365ActivitiesExtensionTest);

        // Act
        ActivitesPage.OpenView();

        // Assert
        ActivitesPage."EUR/DKK".AssertEquals(7.4643);
        ActivitesPage."EUR/USD".AssertEquals(1.0937);
    end;

    [EventSubscriber(ObjectType::Page, Page::"O365 Activities", 'OnBeforePageBackgroundTaskSchedule', '', false, false)]
    local procedure OnBeforePageBackgroundTaskSchedule(var PbtParameters: Dictionary of [Text, Text])
    begin
        // Arrange: Mock the HTTP response
        PbtParameters.Add('MockHttpResponse', '{"rates":{"USD":1.0937,"SEK":10.6598,"DKK":7.4643},"base":"EUR","date":"2019-09-26"}');

        // Arrange: Remove the simulation sleep
        PbtParameters.Remove('SleepSimulation');
    end;

    var
        O365ActivitiesExtensionTest: Codeunit O365ActivitiesExtensionTest;
}