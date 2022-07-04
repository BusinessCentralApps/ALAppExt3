report 11737 "Posted Wdrl. Cash Document CZP"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/PostedWdrlCashDocument.rdl';
    PreviewMode = PrintLayout;
    Caption = 'Posted Withdrawal Cash Document';
    UsageCategory = None;

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = sorting("Primary Key");
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(RegistrationNo_CompanyInformation; "Registration No.")
            {
            }
            column(VATRegistrationNo_CompanyInformation; "VAT Registration No.")
            {
            }
            column(HomePage_CompanyInformation; "Home Page")
            {
            }
            column(Picture_CompanyInformation; Picture)
            {
            }
            dataitem("Sales & Receivables Setup"; "Sales & Receivables Setup")
            {
                DataItemTableView = sorting("Primary Key");
                column(LogoPositiononDocuments_SalesReceivablesSetup; Format("Logo Position on Documents", 0, 2))
                {
                }
                dataitem("General Ledger Setup"; "General Ledger Setup")
                {
                    DataItemTableView = sorting("Primary Key");
                    column(LCYCode_GeneralLedgerSetup; "LCY Code")
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddress.Company(CompanyAddr, "Company Information");
            end;

            trigger OnPreDataItem()
            begin
                CalcFields(Picture);
            end;
        }
        dataitem(PostedCashDocumentHdrCZP; "Posted Cash Document Hdr. CZP")
        {
            CalcFields = "Amount Including VAT";
            column(CashDeskNo_PostedCashDocumentHeader; "Cash Desk No.")
            {
            }
            column(No_PostedCashDocumentHeader; "No.")
            {
            }
            column(CurrencyCode_PostedCashDocumentHeader; "Currency Code")
            {
            }
            column(PostingDate_PostedCashDocumentHeader; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(PaymentPurpose_PostedCashDocumentHeader; "Payment Purpose")
            {
                IncludeCaption = true;
            }
            column(RegistrationNo_PostedCashDocumentHeader; "Registration No.")
            {
                IncludeCaption = true;
            }
            column(VATRegistrationNo_PostedCashDocumentHeader; "VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(PaidTo_PostedCashDocumentHeader; "Paid To")
            {
                IncludeCaption = true;
            }
            column(IdentificationCardNo_PostedCashDocumentHeader; "Identification Card No.")
            {
                IncludeCaption = true;
            }
            column(PaidBy_PostedCashDocumentHeader; "Paid By")
            {
                IncludeCaption = true;
            }
            column(CalculatedExchRate; CalculatedExchRate)
            {
            }
            column(ExchRateText; ExchRateText)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                column(CopyNo; Number)
                {
                }
                dataitem(PostedCashDocumentLineCZP; "Posted Cash Document Line CZP")
                {
                    DataItemLink = "Cash Desk No." = field("Cash Desk No."), "Cash Document No." = field("No.");
                    DataItemLinkReference = PostedCashDocumentHdrCZP;
                    DataItemTableView = sorting("Cash Desk No.", "Cash Document No.", "Line No.");
                    column(LineNo_PostedCashDocumentLine; "Line No.")
                    {
                    }
                    column(Description_PostedCashDocumentLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(AmountIncludingVAT_PostedCashDocumentLine; "Amount Including VAT")
                    {
                        IncludeCaption = true;
                    }
                    column(VAT_PostedCashDocumentLine; "VAT %")
                    {
                        IncludeCaption = true;
                    }
                    column(VATAmount_PostedCashDocumentLine; "VAT Amount")
                    {
                        IncludeCaption = true;
                    }
                    column(VATBaseAmount_PostedCashDocumentLine; "VAT Base Amount")
                    {
                        IncludeCaption = true;
                    }

                    trigger OnPreDataItem()
                    begin
                        TempVATAmountLine.DeleteAll();
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        TempVATAmountLine.Init();
                        TempVATAmountLine."VAT Identifier" := "VAT Identifier";
                        TempVATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                        TempVATAmountLine."VAT %" := "VAT %";
                        TempVATAmountLine."VAT Base" := "VAT Base Amount";
                        TempVATAmountLine."VAT Amount" := "VAT Amount";
                        TempVATAmountLine."Amount Including VAT" := "Amount Including VAT";
                        TempVATAmountLine."VAT Base (LCY) CZL" := "VAT Base Amount (LCY)";
                        TempVATAmountLine."VAT Amount (LCY) CZL" := "VAT Amount (LCY)";
                        TempVATAmountLine.InsertLine();
                    end;
                }
                dataitem(VATCounter; Integer)
                {
                    DataItemTableView = sorting(Number);
                    column(VATAmtLineVATIdentifier; TempVATAmountLine."VAT Identifier")
                    {
                    }
                    column(VATAmtLineVATPer; TempVATAmountLine."VAT %")
                    {
                        DecimalPlaces = 0 : 5;
                        IncludeCaption = true;
                    }
                    column(VATAmtLineVATBase; TempVATAmountLine."VAT Base")
                    {
                        AutoFormatExpression = PostedCashDocumentHdrCZP."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmtLineVATAmt; TempVATAmountLine."VAT Amount")
                    {
                        AutoFormatExpression = PostedCashDocumentHdrCZP."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmtLineVATBaseLCY; TempVATAmountLine."VAT Base (LCY) CZL")
                    {
                        AutoFormatExpression = PostedCashDocumentHdrCZP."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmtLineVATAmtLCY; TempVATAmountLine."VAT Amount (LCY) CZL")
                    {
                        AutoFormatExpression = PostedCashDocumentHdrCZP."Currency Code";
                        AutoFormatType = 1;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        TempVATAmountLine.GetLine(Number);
                    end;

                    trigger OnPreDataItem()
                    begin
                        if not PrintVATSpecification then
                            CurrReport.Break();

                        SetRange(Number, 1, TempVATAmountLine.Count);
                    end;
                }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    DataItemLink = "Document No." = field("No."), "Posting Date" = field("Posting Date");
                    DataItemLinkReference = PostedCashDocumentHdrCZP;
                    DataItemTableView = sorting("Document No.", "Posting Date");
                    column(AccountNo_GLEntry; "G/L Account No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_GLEntry; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(DebitAmount_GLEntry; "Debit Amount")
                    {
                        IncludeCaption = true;
                    }
                    column(CreditAmount_GLEntry; "Credit Amount")
                    {
                        IncludeCaption = true;
                    }

                    trigger OnPreDataItem()
                    begin
                        if not PrintAccountingSheet then
                            CurrReport.Break();
                    end;

                    trigger OnAfterGetRecord()
                    var
                        GLAcc: Record "G/L Account";
                    begin
                        if GLAcc.Get("G/L Account No.") then
                            Description := GLAcc.Name;
                    end;
                }
                dataitem(EETEntryCZL; "EET Entry CZL")
                {
                    DataItemLink = "Entry No." = FIELD("EET Entry No.");
                    DataItemLinkReference = PostedCashDocumentHdrCZP;
                    DataItemTableView = SORTING("Entry No.");
                    column(EntryNo_EETEntry; "Entry No.")
                    {
                    }
                    column(ReceiptSerialNo_EETEntry; "Receipt Serial No.")
                    {
                    }
                    column(CreatedAt_EETEntry; "Created At")
                    {
                    }
                    column(CashRegisterCode_EETEntry; "Cash Register Code")
                    {
                    }
                    column(BusinessPremissesId_EETEntry; GetBusinessPremisesId())
                    {
                    }
                    column(SalesRegimeText_EETEntry; GetSalesRegimeText())
                    {
                    }
                    column(SignatureCode_EETEntry; GetSignatureCode())
                    {
                    }
                    column(SecurityCode_EETEntry; "Taxpayer's Security Code")
                    {
                    }
                    column(FiscalIdentificationCode_EETEntry; "Fiscal Identification Code")
                    {
                    }
                }
                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User ID" = field("Posted ID");
                    DataItemLinkReference = PostedCashDocumentHdrCZP;
                    DataItemTableView = sorting("User ID");
                    dataitem(Employee; Employee)
                    {
                        DataItemLink = "No." = field("Employee No. CZL");
                        DataItemTableView = sorting("No.");
                        column(FullName_Employee; Employee.FullName())
                        {
                        }
                        column(PhoneNo_Employee; Employee."Phone No.")
                        {
                        }
                        column(CompanyEMail_Employee; Employee."Company E-Mail")
                        {
                        }
                    }
                }

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;

                    SetRange(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if "Currency Code" = '' then
                    "Currency Code" := "General Ledger Setup"."LCY Code"
                else
                    if ("Currency Factor" <> 0) and ("Currency Factor" <> 1) then begin
                        CurrencyExchangeRate.FindCurrency("Posting Date", "Currency Code", 1);
                        CalculatedExchRate := Round(1 / "Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.00001);
                        ExchRateText :=
                          StrSubstNo(
                            ExchangeRateTxt, CalculatedExchRate, "General Ledger Setup"."LCY Code",
                            CurrencyExchangeRate."Exchange Rate Amount", "Currency Code");
                    end else
                        CalculatedExchRate := 1;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopiesCZP; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies the number of copies to print.';
                    }
                    field(PrintAccountingSheetCZP; PrintAccountingSheet)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Accounting Sheet';
                        ToolTip = 'Specifies if the accounting sheet is shown.';
                    }
                    field(PrintVATSpecificationCZP; PrintVATSpecification)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print VAT Specification';
                        ToolTip = 'Specifies if the VAT specification is shown.';
                    }
                }
            }
        }
    }

    labels
    {
        DocumentLbl = 'Posted Withdrawal Cash Document';
        PageLbl = 'Page';
        CompanyLbl = 'Company';
        TotalLbl = 'Total';
        VATIdentLbl = 'VAT Recapitulation';
        VATPercentLbl = 'VAT %';
        VATBaseLbl = 'VAT Base';
        VATAmtLbl = 'VAT Amount';
        VATLbl = 'VAT';
        PostedLbl = 'Posted by';
        BusinessPremisesLbl = 'Business Premises:';
        CashRegisterLbl = 'Cash Register:';
        ReceiptSerialNoLbl = 'Receipt Serial No.:';
        BKPLbl = 'BKP:';
        FIKLbl = 'FIK:';
        PKPLbl = 'PKP:';
        IssueDatetimeLbl = 'Issue Datetime:';
        CopyLbl = 'Copy';
    }

    var
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        FormatAddress: Codeunit "Format Address";
        ExchRateText: Text[50];
        CompanyAddr: array[8] of Text[100];
        CalculatedExchRate: Decimal;
        ExchangeRateTxt: Label 'Exchange Rate %1 %2 / %3 %4', Comment = '%1 = Calculated Exchange Rate Amount; %2 = LCY Code; %3 = Exchange Rate Amount; %4 = Currency Code';
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        PrintAccountingSheet: Boolean;
        PrintVATSpecification: Boolean;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewPrintAccountingSheet: Boolean; NewPrintVATSpecification: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        PrintAccountingSheet := NewPrintAccountingSheet;
        PrintVATSpecification := NewPrintVATSpecification
    end;
}
