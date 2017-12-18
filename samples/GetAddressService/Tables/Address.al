// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

table 50100 Address
{
    Caption = 'Address';

    fields
    {
        field(1;Address;Text[50])
        {
            Caption = 'Address';
            Description = 'Address retrieved by Service';
        }
        field(2;Locality;Text[30])
        {
            Caption = 'Locality';
            Description = 'Locality retrieved by Service';
        }
        field(3;"Town/City";Text[30])
        {
            Caption = 'Town/City';
            Description = 'Town/City retrieved by Service';
        }
        field(4;County;Text[30])
        {
            Caption = 'Country';
            Description = 'County retrieved by Service';
        }
    }
    keys
    {
        key(PrimaryKey;Address)
        {
            Clustered = true;
        }
    }
}
