<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="db0d50f2-5576-479b-8eea-97e07444e36a" Name="BOOL_EVENT" Comment="Adapter Interface" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author="Cheyan" Date="12/12/2023" />
  <InterfaceList>
    <EventOutputs>
      <Event Name="ACTUATE" Comment="Confirmation from Plug">
        <With Var="openSwitch" />
      </Event>
    </EventOutputs>
    <OutputVars>
      <VarDeclaration Name="openSwitch" Type="BOOL" Comment="Confirmation Data from Plug" />
    </OutputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="REQ" Parameters="REQD" />
        <OutputPrimitive Interface="PLUG" Event="REQ" Parameters="REQD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="ACTUATE" Parameters="openSwitch" />
        <OutputPrimitive Interface="SOCKET" Event="ACTUATE" Parameters="openSwitch" />
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="IND" Parameters="INDD" />
        <OutputPrimitive Interface="SOCKET" Event="IND" Parameters="INDD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="RSP" Parameters="RSPD" />
        <OutputPrimitive Interface="PLUG" Event="RSP" Parameters="RSPD" />
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>