// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

page 50100 "Demo AL Currency Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Demo AL Currency Setup";

    layout
    {
        area(Content)
        {
            group("Setup")
            {
                field(SleepDurationFactbox; SleepDurationFactbox)
                {
                    ApplicationArea = All;
                    Caption = 'Factbox sleep duration in MS';
                }

                field(SleepDurationRoleCenter; SleepDurationRoleCenter)
                {
                    ApplicationArea = All;
                    Caption = 'Role Center sleep duration in MS';
                }
            }
        }
    }
}