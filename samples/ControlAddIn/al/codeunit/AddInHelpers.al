codeunit 50301 AddInHelpers
{
    var globalAddIn : ControlAddIn TestAddIn;

    procedure CallJavaScript(addin : ControlAddIn TestAddIn)
    begin
        addin.CallJavaScript(1, 'Called from codeunit', 2.0, 'a');
    end;

    procedure CallJavaScriptViaGlobalVar(addin : ControlAddIn TestAddIn)
    begin
        globalAddIn := addin;

        globalAddIn.CallJavaScript(1, 'Called from codeunit via global var', 2.0, 'a');
    end;

    procedure CallJavaScriptByRef(addin : ControlAddIn TestAddIn)
    begin
        globalAddIn := addin;
        AssignGlobalToLocal(addin);
        addin.CallJavaScript(1, 'Invoked after passing control add-in by ref', 2.0, 'a');
    end;

    procedure CallOnUnInitializedVar()
    var addin : ControlAddIn TestAddIn;
    begin
        //testing what the runtime error looks like...
        addin.CallJavaScript(1, 'Where am I?', 2.0, 'a');
    end;

    local procedure AssignGlobalToLocal(var addin : ControlAddIn TestAddIn)
    begin
        addin := globalAddIn;
    end;
}