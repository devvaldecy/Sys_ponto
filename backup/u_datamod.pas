unit u_datamod;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, ZAbstractRODataset;

type

  { TFrmDM }

  TFrmDM = class(TDataModule)
    zCadsetemail: TZRawCLobField;
    zCadsetid: TZInt64Field;
    zCadsetnome: TZRawCLobField;
    zCadsettelefone: TZRawStringField;
    zConecte: TZConnection;
    zCadset: TZQuery;
    zQconsultasetor: TZQuery;
    zTransacoes: TZTransaction;
    procedure zConecteAfterConnect(Sender: TObject);
  private

  public

  end;

var
  FrmDM: TFrmDM;

implementation

{$R *.lfm}

{ TFrmDM }

procedure TFrmDM.zConecteAfterConnect(Sender: TObject);
begin

end;

end.

