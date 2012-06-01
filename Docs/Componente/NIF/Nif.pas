unit Nif;

interface

uses
  Classes;
  //Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TNif = class(TComponent)
  private
    FDNI            : Longint;
    function GetNIF : Char;
  protected
  public
    property NIF : Char read GetNIF;
  published
    property DNI : Longint read FDNI write FDNI;
  end;

procedure Register;

implementation

function TNIF.GetNIF : Char;
var aux1 : integer;
const letras : string = 'TRWAGMYFPDXBNJZSQVHLCKE';
begin
  aux1 := FDNI - ((FDNI div 23) * 23);
  result := letras[aux1+1];
end;

procedure Register;
begin
  RegisterComponents('Componentes', [TNif]);
end;

end.
 