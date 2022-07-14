// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

page 13645 "OIOUBL-Profile List"
{
    DataCaptionFields = "OIOUBL-Code", "OIOUBL-Profile ID";
    PageType = List;
    SourceTable = "OIOUBL-Profile";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("OIOUBL-Code"; "OIOUBL-Code")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the code for the Offentlig Information Online UBL (OIOUBL) profile.';
                }
                field("OIOUBL-Profile ID"; "OIOUBL-Profile ID")
                {
                    ApplicationArea = Basic, Suite;
                    Tooltip = 'Specifies the available profile IDs that can be used for electronic invoicing of the public sector in Denmark.';
                }
            }
        }
    }

    actions
    {
    }
}
