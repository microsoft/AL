// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

page 70051004 "Service Setup"
{
    PageType = Card;
    SourceTable = "Service Connection Setup"; 
    InsertAllowed = False;
    DeleteAllowed = False;
    ShowFilter = False;
    LinksAllowed = False;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Service URL";"Service URL") { ApplicationArea = All; }
                field("API Key";"API Key") { ApplicationArea = All; }
            }
        }
    }
}