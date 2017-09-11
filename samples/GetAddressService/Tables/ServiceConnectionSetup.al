// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

table 70051001 "Service Connection Setup" 
{
    fields
    {
        field(1;"Primary Key";Code[10])
        {
            Description = 'The primary key of the setup entry';
        }
        field(2;"Service URL";Text[250])
        {
            Description = 'The Service URL of the service you want to connect to.';
            ExtendedDataType = URL;
        }
        field(3;"API Key";Text[100])
        {
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