// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

table 50101 "Service Connection Setup" 
{
    Caption = 'Service Connection Setup';
    fields
    {
        field(1;"Primary Key";Code[10])
        {
            Caption = 'Primary Key';
            Description = 'The primary key of the setup entry';
        }
        field(2;"Service URL";Text[250])
        {
            Caption = 'Service URL';
            Description = 'The Service URL of the service you want to connect to.';
            ExtendedDataType = URL;
        }
        field(3;"API Key";Text[100])
        {
            Caption = 'API Key';
            Description = 'The API Key of the service you want to connect to.';
            ExtendedDataType = Masked;
        }
    }
    keys
    {
        key(PrimaryKey;"Primary Key")
        {
            Clustered = true;
        }
    }
}