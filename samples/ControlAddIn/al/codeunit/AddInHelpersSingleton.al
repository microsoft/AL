codeunit 50302 AddInHelpersSingleton
{
    SingleInstance = true;

    var globalAddIn : ControlAddIn TestAddIn;

    procedure StoreAddInReference(addin : ControlAddIn TestAddIn)
    begin
        globalAddIn := addin;
    end;

    procedure CallStaleAddInMethod();
    begin
        globalAddIn.CallJavaScript(1, 'Calling on stale reference', 1, 'a');
    end;
}