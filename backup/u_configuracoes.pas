unit u_configuracoes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  u_cadpadrao;

type

  { TFrmConfiguracoes }

  TFrmConfiguracoes = class(TFrmcadpadrao)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure BtnPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  FrmConfiguracoes: TFrmConfiguracoes;

implementation

{$R *.lfm}

{ TFrmConfiguracoes }

procedure TFrmConfiguracoes.BtnPesquisarClick(Sender: TObject);
begin

end;

end.

