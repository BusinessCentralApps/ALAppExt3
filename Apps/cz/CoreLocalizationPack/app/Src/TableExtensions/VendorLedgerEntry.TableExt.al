tableextension 11721 "Vendor Ledger Entry CZL" extends "Vendor Ledger Entry"
{
    fields
    {
        field(11717; "Specific Symbol CZL"; Code[10])
        {
            Caption = 'Specific Symbol';
            CharAllowed = '09';
            DataClassification = CustomerContent;
        }
        field(11718; "Variable Symbol CZL"; Code[10])
        {
            Caption = 'Variable Symbol';
            CharAllowed = '09';
            DataClassification = CustomerContent;
        }
        field(11719; "Constant Symbol CZL"; Code[10])
        {
            Caption = 'Constant Symbol';
            CharAllowed = '09';
            TableRelation = "Constant Symbol CZL";
            DataClassification = CustomerContent;
        }
        field(11720; "Bank Account Code CZL"; Code[20])
        {
            Caption = 'Bank Account Code';
            TableRelation = if ("Document Type" = filter(Invoice | Payment | Reminder | "Finance Charge Memo")) "Vendor Bank Account".Code where("Vendor No." = field("Vendor No.")) else
            if ("Document Type" = filter("Credit Memo" | Refund)) "Bank Account";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                VendorBankAccount: Record "Vendor Bank Account";
                BankAccount: Record "Bank Account";
            begin
                if "Bank Account Code CZL" = '' then begin
                    UpdateBankInfoCZL('', '', '', '', '');
                    exit;
                end;
                case "Document Type" of
                    "Document Type"::Payment, "Document Type"::"Finance Charge Memo",
                    "Document Type"::Invoice, "Document Type"::Reminder:
                        begin
                            TestField("Vendor No.");
                            VendorBankAccount.Get("Vendor No.", "Bank Account Code CZL");
                            UpdateBankInfoCZL(
                              VendorBankAccount.Code,
                              VendorBankAccount."Bank Account No.",
                              VendorBankAccount."Transit No.",
                              VendorBankAccount.IBAN,
                              VendorBankAccount."SWIFT Code");
                        end;
                    "Document Type"::"Credit Memo", "Document Type"::Refund:
                        begin
                            BankAccount.Get("Bank Account Code CZL");
                            UpdateBankInfoCZL(
                              BankAccount."No.",
                              BankAccount."Bank Account No.",
                              BankAccount."Transit No.",
                              BankAccount.IBAN,
                              BankAccount."SWIFT Code");
                        end;
                end;
            end;
        }
        field(11721; "Bank Account No. CZL"; Text[30])
        {
            Caption = 'Bank Account No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11724; "Transit No. CZL"; Text[20])
        {
            Caption = 'Transit No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11725; "IBAN CZL"; Code[50])
        {
            Caption = 'IBAN';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11726; "SWIFT Code CZL"; Code[20])
        {
            Caption = 'SWIFT Code';
            Editable = false;
            TableRelation = "SWIFT Code";
            DataClassification = CustomerContent;
        }
        field(11780; "VAT Date CZL"; Date)
        {
            Caption = 'VAT Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    procedure GetTransactionNoCZL(EntryNo: Integer): Integer
    begin
        Rec.Get(EntryNo);
        exit(Rec."Transaction No.");
    end;

    local procedure UpdateBankInfoCZL(BankAccountCode: Code[20]; BankAccountNo: Text[30]; TransitNo: Text[20]; IBANCode: Code[50]; SWIFTCode: Code[20])
    begin
        "Bank Account Code CZL" := BankAccountCode;
        "Bank Account No. CZL" := BankAccountNo;
        "Transit No. CZL" := TransitNo;
        "IBAN CZL" := IBANCode;
        "SWIFT Code CZL" := SWIFTCode;
        OnAfterUpdateBankInfoCZL(Rec);
    end;

    procedure CalcSuggestedAmountToApplyCZL(): Decimal
    var
        CrossApplicationMgtCZL: Codeunit "Cross Application Mgt. CZL";
    begin
        exit(CrossApplicationMgtCZL.CalcSuggestedAmountToApplyVendorLedgerEntry(Rec));
    end;

    procedure DrillDownSuggestedAmountToApplyCZL()
    var
        CrossApplicationMgtCZL: Codeunit "Cross Application Mgt. CZL";
    begin
        CrossApplicationMgtCZL.DrillDownSuggestedAmountToApplyVendorLedgerEntry(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateBankInfoCZL(var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
    end;
}
