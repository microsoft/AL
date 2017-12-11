// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

page 50103 Addresses
{
    PageType = List;
    SourceTable = Address;
    SourceTableTemporary = True;
    InsertAllowed = False;
    DeleteAllowed = False;
    ModifyAllowed = False;
    ShowFilter = False;
    LinksAllowed = False;

    Caption = 'Addresses';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Address;Address) 
                { 
                    Caption = 'Address';
                    ApplicationArea = All; 
                }
                field(Locality;Locality) 
                { 
                    Caption = 'Locality';
                    ApplicationArea = All; 
                }
                field("Town/City";"Town/City") 
                { 
                    Caption = 'Town/City';
                    ApplicationArea = All; 
                }
                field(County;County) 
                { 
                    Caption = 'Country';
                    ApplicationArea = All; 
                }
            }
        }
    }
    
    procedure SetRecords(var tempAddress : Record Address temporary);
    begin
        Copy(tempAddress,true);
    end;
}