// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

table 50100 "Latest Currency Rate"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = SystemMetadata;
        }
        field(2; Rate; Decimal)
        {
            DataClassification = SystemMetadata;
        }
    }
}