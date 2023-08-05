unit Vendas.Controller.Classes.Util;

interface

uses
  Vcl.Controls,
  Vcl.StdCtrls,
  System.Classes,
  System.SysUtils, Vcl.DBCtrls;

function RetornarEdit(AControleParente: TDBLabeledEdit; ANomeCampo: string): TDBLabeledEdit;

implementation

function RetornarEdit(AControleParente: TDBLabeledEdit; ANomeCampo: string): TDBLabeledEdit;
var
  LNomeCampo: string;
  LComponente: TComponent;
begin
  LNomeCampo := format('edt%s',[ANomeCampo]);
  LComponente:= AControleParente.Parent.findcomponent(LNomeCampo);
  if Assigned(LComponente) then
    result := (LComponente as TDBLabeledEdit)
  else
    result := nil
end;


end.
