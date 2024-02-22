<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="c17c79be-6b32-4bd1-b2a7-f98a6dc74880" Comment="Adapter Interface" Name="SV" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author="Cheyan" Date="12/12/2023" />
  <InterfaceList>
    <EventOutputs>
      <Event Name="SAMPLE" Comment="Confirmation from Plug">
        <With Var="currentMeasurement" />
      </Event>
    </EventOutputs>
    <OutputVars>
      <VarDeclaration Name="currentMeasurement" Type="LREAL" Comment="Confirmation Data from Plug" />
    </OutputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="REQ" Parameters="REQD" />
        <OutputPrimitive Interface="PLUG" Event="REQ" Parameters="REQD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="SAMPLE" Parameters="currentMeasurement" />
        <OutputPrimitive Interface="SOCKET" Event="SAMPLE" Parameters="currentMeasurement" />
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