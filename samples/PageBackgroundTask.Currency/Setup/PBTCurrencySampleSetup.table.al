// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

table 50101 "PBT Currency Sample Setup"
{
    DataClassification = SystemMetadata;
    DataPerCompany = false;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; SleepDurationRoleCenter; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(3; SleepDurationFactbox; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(4; SleepDurationFactboxRepeater; Integer)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key("Primary Key"; "Primary Key")
        {
            Clustered = true;
        }
    }
}