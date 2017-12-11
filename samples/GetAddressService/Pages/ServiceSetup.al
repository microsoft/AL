// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

page 50104 "Service Setup"
{
    PageType = Card;
    SourceTable = "Service Connection Setup"; 
    InsertAllowed = False;
    DeleteAllowed = False;
    ShowFilter = False;
    LinksAllowed = False;

    Caption = 'Service Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Service URL";"Service URL") 
                { 
                    Caption = 'Serivce URL';
                    ApplicationArea = All; 
                }
                field("API Key";"API Key") 
                { 
                    Caption = 'API Key';
                    ApplicationArea = All; 
                }
            }
        }
    }
}