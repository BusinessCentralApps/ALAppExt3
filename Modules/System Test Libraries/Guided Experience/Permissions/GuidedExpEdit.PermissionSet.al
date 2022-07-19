// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

permissionset 132594 "Guided Exp Edit"
{
    Assignable = true;
    IncludedPermissionSets = "Guided Experience - Edit";

    Permissions = tabledata "User Checklist Status" = D,
                  tabledata "User Personalization" = RM,
                  tabledata "Guided Experience Item" = D,
                  tabledata Company = RM,
                  // insert into "All profile"
                  tabledata "All Profile" = R,
                  tabledata "Tenant Profile Page Metadata" = R,
                  tabledata "Tenant Profile" = RI,
                  tabledata "Profile Configuration Symbols" = RI,
                  tabledata "Tenant Profile Setting" = I;
}