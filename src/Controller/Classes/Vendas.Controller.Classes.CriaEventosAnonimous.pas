unit Vendas.Controller.Classes.CriaEventosAnonimous;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TCriaEventosAnonymous = class(TComponent)
  protected
    FProcedimento: TProc<TObject>;
    procedure OnNotificaEvento(Sender: TObject);
  public
    class function Create(Owner: TComponent; const Closure: TProc<TObject>): TNotifyEvent; reintroduce;
    function Anexar(const Closure: TProc<TObject>): TNotifyEvent;
  end;

implementation

class function TCriaEventosAnonymous.Create(Owner: TComponent; const Closure: TProc<TObject>): TNotifyEvent;
begin
  Result := inherited Create(Owner).Anexar(Closure);
end;

function TCriaEventosAnonymous.Anexar(const Closure: TProc<TObject>): TNotifyEvent;
begin
  FProcedimento := Closure;
  Result := Self.OnNotificaEvento
end;

procedure TCriaEventosAnonymous.OnNotificaEvento(Sender: TObject);
begin
  if Assigned(FProcedimento) then
    FProcedimento(Sender)
end;

end.
