unit UFuncBD;

interface

uses DB, UConexao;

function SFN_RETORNA_PROX(cnn: TConexao; comando, Campo: string): string;

implementation


function SFN_RETORNA_PROX(cnn: TConexao; comando, Campo: string): string;

var dts: TDataSource;

begin
  if cnn.ExecuteQuery(comando,dts) then
  begin
    if pointer(dts.DataSet.FieldByName(Campo).AsString) = nil then
      Result := '1'
    else
      Result := dts.DataSet.FieldByName(Campo).AsString;

  exit;
  end
  else
    Result := '1';
end;


end.
