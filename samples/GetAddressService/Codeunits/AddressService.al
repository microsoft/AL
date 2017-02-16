// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved. 
// Licensed under the MIT License. See License.txt in the project root for license information. 
// ------------------------------------------------------------------------------------------------

codeunit 70051002 "Address Service"
{
    var
        AddressesWhereFoundMsg : TextConst ENU='Would you like to look for addresses on this post code online?';
        NoaddressesFoundMsg : TextConst ENU='No addresses were found.';
        YesPleaseTxt : TextConst ENU='Yes, please';
        PostCodeValidationRegExTxt : TextConst ENU='(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY])))) [0-9][A-Z-[CIKMOV]]{2})';

    [EventSubscriber(ObjectType::Table,18,'OnAfterValidateEvent','Post Code',false,false)]
    procedure OnCustomerpostCodeValidate(var Rec : Record customer;var xRec : Record customer;currFieldNo : Integer);
    begin
        CreateAddressLookupnotification(Rec);
    end;

    [EventSubscriber(ObjectType::Table,23,'OnAfterValidateEvent','Post Code',false,false)]
    procedure OnVendorpostCodeValidate(var Rec : Record Vendor;var xRec : Record Vendor;CurrFieldNo : Integer);
    begin
        CreateAddressLookupnotification(Rec);
    end;

    [EventSubscriber(ObjectType::Table,1400,'OnRegisterServiceConnection','',false,false)]
    local procedure HandleAddressLookupServiceConnection(var serviceConnection : Record "Service Connection");
    var
      serviceConnectionSetup : Record "Service Connection Setup";
      recRef : RecordRef;
    begin
      if not serviceConnectionSetup.Get then begin
        serviceConnectionSetup.Init;
        serviceConnectionSetup."Service URL" := 'https://api.getAddress.io/v2/uk';
        serviceConnectionSetup.Insert;
      end;

      recRef.GetTable(serviceConnectionSetup);

      serviceConnection.Status := serviceConnection.Status::Enabled;
      if (serviceConnectionSetup."Service URL" = '') or (serviceConnectionSetup."API Key" = '') then
        serviceConnection.Status := serviceConnection.Status::Disabled;

      with serviceConnectionSetup do
        serviceConnection.InsertServiceConnection(
          serviceConnection,recRef.RecordId,'Get Address Service Setup','',Page::"Service Setup");
    end;

    procedure CreateAddressLookupnotification(recvariant : variant);
    var
      serviceConnectionSetup : Record "Service Connection Setup";
      dataTypeManagement : Codeunit "Data Type Management";
      addressNotification : Notification;
      recRef : RecordRef;
      postCodefieldRef : FieldRef;
    begin
      dataTypeManagement.GetRecordRef(recvariant,recRef);
      postCodefieldRef := recRef.Field(91); // Post Code

      if not serviceConnectionSetup.Get then
        exit;

      if (serviceConnectionSetup."Service URL" = '') or (serviceConnectionSetup."API Key" = '') then
        exit;
        
      if not postCodeValid(recRef) then
        exit;

      addressNotification.Message := AddressesWhereFoundMsg;
      addressNotification.SetData('recID',Format(recRef.RecordId));
      addressNotification.SetData('postCode',Format(postCodefieldRef.Value));
      addressNotification.AddAction(YesPleaseTxt,Codeunit::"Address Service",'Lookupaddresses');
      addressNotification.Send;
    end;

    local procedure postCodeValid(recRef : RecordRef) dataValid : Boolean;
    var
      typeHelper : Codeunit "Type Helper";
      fieldRef : FieldRef;
      postCode : Code[20];
      countryRegionCode : Code[10];
    begin
      fieldRef := recRef.Field(91); // Post Code
      postCode := Format(fieldRef.Value);
      fieldRef := recRef.Field(35); // Country/Region Code
      countryRegionCode := Format(fieldRef.Value);

      if postCode = '' then
        exit(false);

      dataValid := (countryRegionCode = '') or (countryRegionCode = 'GB');
      dataValid := dataValid and typeHelper.IsMatch(postCode,PostCodeValidationRegExTxt);
      exit;
    end;

    procedure Lookupaddresses(addressNotification : Notification);
    var
      tempAddress : Record Address temporary;
      addresses : Page Addresses;
      recID : RecordID;
      recRef : RecordRef;
    begin
      Getaddresses(addressNotification.GetData('postCode'),tempAddress);
      Evaluate(recID,addressNotification.GetData('recID'));
      recRef.Get(recID);

      case tempAddress.Count of
        0:
          Message(NoaddressesFoundMsg);
        1:
          UpdateRecordWithAddressInformation(recRef,tempAddress);
        else begin
          addresses.SetRecords(tempAddress);
          addresses.LookupMode(true);
          if addresses.RunModal = Action::LookupOK then begin
            addresses.GetRecord(tempAddress);
            UpdateRecordWithAddressInformation(recRef,tempAddress);
          end;
        end;
      end;
    end;

    local procedure Getaddresses(postCode : Code[20];var tempAddress : Record Address temporary);
    var
      addressList : JsonArray;
      addressToken : JsonToken;
      i : Integer;
    begin
      if not ConnectToServiceAndFillBuffer(postCode,addressList) then
        exit;
      
      for i:=0 to addressList.Count-1 do begin
        addressList.Get(i,addressToken);
        GetAddressFromAddressString(addressToken.AsValue().AsText(),tempAddress);
      end;
    end;

    local procedure GetAddressFromAddressString(address : Text; var addressRec : Record Address temporary);
    begin
        addressRec.Init;
        addressRec.Address := DelChr(SelectStr(1,address),'<>');
        AppendToString(SelectStr(2,address),addressRec.Address);
        AppendToString(SelectStr(3,address),addressRec.Address);
        AppendToString(SelectStr(4,address),addressRec.Address);
        addressRec.Locality := DelChr(SelectStr(5,address),'<>');
        addressRec."Town/City" := DelChr(SelectStr(6,address),'<>');
        addressRec.County := DelChr(SelectStr(7,address),'<>');
        if addressRec.Insert then;
    end;

    local procedure ConnectToServiceAndFillBuffer(postCode : Code[20];var addresses : JsonArray) : Boolean;
    var
      serviceConnectionSetup : Record "Service Connection Setup";
      tempBlob : Record TempBlob temporary;
      httpClient : HttpClient;
      httpResponse : HttpResponseMessage;
      contentInStream : InStream;
      jsonResponse : JsonToken;
      addressesToken : JsonToken;
    begin
      if not serviceConnectionSetup.Get then
        exit(false);

      if ((serviceConnectionSetup."Service URL" = '') or (serviceConnectionSetup."API Key" = '')) then
        exit(false);
        
      if (not httpClient.Get(serviceConnectionSetup."Service URL" + '/' +
        DelChr(postCode,'=') + '?api-key=' + serviceConnectionSetup."API Key",httpResponse)) then
      begin
        Error('Failed to contact the address endpoint.');
      end;
        
      if (not httpResponse.IsSuccessStatusCode) then
        exit(false);

      tempBlob.Init;
      tempBlob.Blob.CreateInStream(contentInStream);
      httpResponse.Content.ReadAs(contentInStream);
      jsonResponse.ReadFrom(contentInStream);
            
      if (not jsonResponse.SelectToken('Addresses', addressesToken)) then
        exit(false);

      addresses := addressesToken.AsArray();
      Exit(addresses.Count <> 0);
    end;

    local procedure UpdateRecordWithAddressInformation(recRef : RecordRef;tempAddress : Record Address temporary);
    var
      fieldRef : FieldRef;
    begin
      fieldRef := recRef.Field(5); // Address
      fieldRef.VALUE := tempAddress.Address;
      fieldRef := recRef.Field(7); // City
      fieldRef.VALUE := tempAddress."Town/City";
      fieldRef := recRef.Field(92); // County
      fieldRef.VALUE := tempAddress.County;
      fieldRef := recRef.Field(35); // County
      fieldRef.VALUE := 'GB';
      recRef.Modify;
    end;

    local procedure AppendToString(inputString : Text;var outputString : Text);
    begin
      inputString := DelChr(inputString,'<>');
      if inputString = '' then
        exit;

      outputString += ', ' + inputString;
    end;
}