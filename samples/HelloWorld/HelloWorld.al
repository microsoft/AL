// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

codeunit 70051001 HelloWorld
{
    TableNo = Customer;

    trigger OnRun();
    var
        HelloText : Codeunit GreetingsManagement;
    begin
        Message('%1, %2', HelloText.GetRandomGreeting(), Rec.Name);
    end;
}