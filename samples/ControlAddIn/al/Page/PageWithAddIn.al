page 50300 PageWithAddIn
{
    layout
    {
        area(Content)
        {
            usercontrol(ControlName; TestAddIn)
            {
                ApplicationArea = All;

                trigger Callback(i : integer; s: text; d : decimal; c : char)
                begin
                    Message('Got from js: %1, %2, %3, %4', i, s, d, c);
                end;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(CallJavaScript)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    CurrPage.ControlName.CallJavaScript(5, 'text', 6.3, 'c');
                end;
            }

            action(CallViaCodeunit)
            {
                ApplicationArea = All;

                trigger OnAction();
                var c : Codeunit AddInHelpers;
                begin
                    c.CallJavaScript(CurrPage.ControlName);
                end;
            }

            action(CallByRef)
            {
                ApplicationArea = All;

                trigger OnAction();
                var c : Codeunit AddInHelpers;
                begin
                    c.CallJavaScriptByRef(CurrPage.ControlName);
                end;
            }

            action(CallViaCodeunitGlobalVar)
            {
                ApplicationArea = All;

                trigger OnAction();
                var c : Codeunit AddInHelpers;
                begin
                    c.CallJavaScriptViaGlobalVar(CurrPage.ControlName);
                end;
            }

            action(StoreAddInRef)
            {
                ApplicationArea = All;

                trigger OnAction();
                var c : Codeunit AddInHelpersSingleton;
                begin
                    c.StoreAddInReference(CurrPage.ControlName);
                    Message('Reference to control add-in stored globally, try to call it now from CustomerCard page extesion');
                end;
            }

            action(CallUnInitialized)
            {
                ApplicationArea = All;

                trigger OnAction();
                var c : Codeunit AddInHelpers;
                begin
                    c.CallOnUnInitializedVar();
                end;
            }

        }
    }
}