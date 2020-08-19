<?xml version="1.0" encoding="UTF-8"?>
<graphml xmlns="http://iconsulting.biz/dfm"><graph id="G" edgedefault="directed" toolversion="3.2.2.0" factSchemaId="25d3b61d-4a90-4af9-ace0-8eb59025e31f" name="flights" xmlns=""><node><data><Fact Name="flights" Description="" Id="3b696568-41f9-4e4d-8dc6-d4bca5facb9e" X="585" Y="315" Width="205.37666666666667" Height="206"><Measures><Measure Name="flight_id" Id="6a9e116f-ac3f-4aaf-9be7-e36d780dbdb5"><Formula /></Measure><Measure Name="flight_date" Id="cf109c0a-8b9e-406b-9ae4-750080ae507f"><Formula /></Measure><Measure Name="departure_time_(actual)" Id="f2a513ef-458e-4368-8776-3b867ecd483f"><Formula /></Measure><Measure Name="arrival_time_(actual)" Id="2fa62000-4dfe-4a29-a590-222c3129ab5f"><Formula /></Measure><Measure Name="*flight_time_(actual)" Id="57a35cd6-1619-4214-a439-022bc6e6c405"><Formula /></Measure><Measure Name="aircraft_registration_code" Id="00264419-bc7e-4018-8157-df2a2f582e81"><Formula /></Measure><Measure Name="cancelled" Id="71b4deaa-9a48-428c-ae02-bc3ceb341048"><Formula /><logicalModeling DbType="BOOLEAN" /></Measure></Measures><GroupsOfMeasures /></Fact></data></node><node><data><Attribute Name="time" Description="" Id="08f9d8e3-613a-40a4-80f5-5d0e38f5e98c" X="881" Y="409" /></data></node><node><data><Attribute Name="day" Description="" Id="65188ff9-3216-434a-8231-9e78e24310b5" X="972" Y="408"><logicalModeling DbType="VARCHAR" Length="255" /></Attribute></data></node><node><data><Attribute Name="month" Description="" Id="c82376cf-7020-4b87-abc3-f6d521ddcbbb" X="1063" Y="406" /></data></node><node><data><Attribute Name="year" Description="" Id="4734223d-1164-49f0-84f9-e58b7f5ca326" X="1155" Y="409" /></data></node><node><data><Attribute Name="aircraft" Description="" Id="f796827f-c67b-4af1-ac02-164176072ef1" X="475" Y="409"><logicalModeling DbType="VARCHAR" Length="255" /></Attribute></data></node><node><data><Attribute Name="aircraft_registration_code" Description="" Id="2bbd73d6-556a-4fd1-9ce2-525287db5117" X="385" Y="445" /></data></node><node><data><Attribute Name="aircraft_model" Description="" Id="1ea42915-2f25-4ecd-abf9-75d165af3937" X="295" Y="480" /></data></node><edge id="5f2240c9-c5e6-4f78-91fd-7b8ab6c1ee1c" source="3b696568-41f9-4e4d-8dc6-d4bca5facb9e" target="08f9d8e3-613a-40a4-80f5-5d0e38f5e98c"><data><Arc /></data></edge><edge id="00252604-42ca-4d90-bf28-b052b931a5fb" source="08f9d8e3-613a-40a4-80f5-5d0e38f5e98c" target="65188ff9-3216-434a-8231-9e78e24310b5"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="4ff42055-4562-4b49-a5bf-f7eaa52ca2da" source="65188ff9-3216-434a-8231-9e78e24310b5" target="c82376cf-7020-4b87-abc3-f6d521ddcbbb"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="0dc5abe0-765e-4641-bd45-e3fa148e7556" source="c82376cf-7020-4b87-abc3-f6d521ddcbbb" target="4734223d-1164-49f0-84f9-e58b7f5ca326"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="9ff17fc4-c2dd-486c-8850-ccd72a3f78fc" source="3b696568-41f9-4e4d-8dc6-d4bca5facb9e" target="f796827f-c67b-4af1-ac02-164176072ef1"><data><Arc /></data></edge><edge id="7c14657d-2134-4108-820d-178260e93021" source="f796827f-c67b-4af1-ac02-164176072ef1" target="2bbd73d6-556a-4fd1-9ce2-525287db5117"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="2b56deb4-ba57-4269-aee1-dfbea208fede" source="2bbd73d6-556a-4fd1-9ce2-525287db5117" target="1ea42915-2f25-4ecd-abf9-75d165af3937"><data><Arc IndexOfSameNodesLink="1" /></data></edge><hierarchy id="92ff9054-2fe6-46ed-9ff9-b9b480d15546" rootArcId="5f2240c9-c5e6-4f78-91fd-7b8ab6c1ee1c" name="time" description="" note="" /><hierarchy id="e492cb6d-c138-4726-8bc1-deff0cdac4c3" rootArcId="9ff17fc4-c2dd-486c-8850-ccd72a3f78fc" name="aircraft" description="" note="" /></graph><additivityMatrix xmlns=""><item measureId="6a9e116f-ac3f-4aaf-9be7-e36d780dbdb5" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="6a9e116f-ac3f-4aaf-9be7-e36d780dbdb5" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="cf109c0a-8b9e-406b-9ae4-750080ae507f" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="cf109c0a-8b9e-406b-9ae4-750080ae507f" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="f2a513ef-458e-4368-8776-3b867ecd483f" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="f2a513ef-458e-4368-8776-3b867ecd483f" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="2fa62000-4dfe-4a29-a590-222c3129ab5f" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="2fa62000-4dfe-4a29-a590-222c3129ab5f" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="57a35cd6-1619-4214-a439-022bc6e6c405" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="57a35cd6-1619-4214-a439-022bc6e6c405" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="00264419-bc7e-4018-8157-df2a2f582e81" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="00264419-bc7e-4018-8157-df2a2f582e81" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item><item measureId="71b4deaa-9a48-428c-ae02-bc3ceb341048" hierarchyId="92ff9054-2fe6-46ed-9ff9-b9b480d15546"><operator id="Sum" /></item><item measureId="71b4deaa-9a48-428c-ae02-bc3ceb341048" hierarchyId="e492cb6d-c138-4726-8bc1-deff0cdac4c3"><operator id="Sum" /></item></additivityMatrix></graphml>