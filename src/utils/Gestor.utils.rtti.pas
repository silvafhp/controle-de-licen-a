﻿unit Gestor.utils.rtti;

interface

uses
  System.Rtti,
  System.SysUtils,
  Gestor.utils.Rtti.helper;

type

  iUtilsRtti<T> = interface
    ['{804F282B-ECDD-4D20-9AE2-3C738AAC131A}']
    function EndPoint(var EndPoint: string): iUtilsRtti<T>;
    function RestID(var ID: string): iUtilsRtti<T>;
  end;

  EUtilsRTTI = Exception;

  TUtilsRtti<T: class, constructor> = class(TInterfacedObject, iUtilsRtti<T>)
  private
    FInstance: T;
    function PrepareEndPoint(Value: string): string;
    function __GetRTTIPropertyValue(aEntity: T; aPropertyName: String): String;
    function __GetRTTIProperty(aEntity: T; aPropertyName: String)
      : TRttiProperty;
  public
    constructor Create(aInstance: T);
    destructor Destroy; override;
    class function New(aInstance: T): iUtilsRtti<T>;
    function EndPoint(var EndPoint: string): iUtilsRtti<T>;
    function RestID(var ID: string): iUtilsRtti<T>;
  end;

implementation

uses
  System.TypInfo,
  Gestor.utils.rest.attributes;

{ TUtilsRtti<T> }

constructor TUtilsRtti<T>.Create(aInstance: T);
begin
  FInstance := aInstance;
end;

destructor TUtilsRtti<T>.Destroy;
begin

  inherited;
end;

function TUtilsRtti<T>.EndPoint(var EndPoint: string): iUtilsRtti<T>;
var
  vInfo: PTypeInfo;
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  Result := Self;
  vInfo := System.TypeInfo(T);
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(vInfo);
    if vTypRtti.Tem<RestData> then
      EndPoint := PrepareEndPoint(vTypRtti.GetAttribute<RestData>.EndPoint);
  finally
    vCtxRtti.Free;
  end;
end;

class function TUtilsRtti<T>.New(aInstance: T): iUtilsRtti<T>;
begin
  Result := Self.Create(aInstance);
end;

function TUtilsRtti<T>.PrepareEndPoint(Value: string): string;
var
  vInfo: PTypeInfo;
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
  partes: TArray<string>;
  x: integer;
begin
  partes := Value.Split(['/']);
  for x := low(partes) to High(partes) do
  begin
    if partes[x].StartsWith(':') then
      partes[x] := __GetRTTIPropertyValue(FInstance, partes[x].Substring(1));
    Result := Format('%s/%s', [Result, partes[x]]);
  end;
end;

function TUtilsRtti<T>.RestID(var ID: string): iUtilsRtti<T>;
var
  ctxRtti: TRttiContext;
  typRtti: TRttiType;
  prpRtti: TRttiProperty;
  Info: PTypeInfo;
begin
  Result := Self;
  Info := System.TypeInfo(T);
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(Info);
    for prpRtti in typRtti.GetProperties do
    begin
      if prpRtti.Tem<RestPK> then
        ID := prpRtti.GetValue(Pointer(FInstance)).ToString;
    end;
  finally
    ctxRtti.Free;
  end;
end;

function TUtilsRtti<T>.__GetRTTIProperty(aEntity: T; aPropertyName: String)
  : TRttiProperty;
var
  ctxRttiEntity: TRttiContext;
  typRttiEntity: TRttiType;
begin
  ctxRttiEntity := TRttiContext.Create;
  try
    typRttiEntity := ctxRttiEntity.GetType(aEntity.ClassInfo);
    Result := typRttiEntity.GetProperty(aPropertyName);
    if not Assigned(Result) then
      raise EUtilsRTTI.Create('Property ' + aPropertyName + ' not found!');
  finally
    ctxRttiEntity.Free;
  end;
end;

function TUtilsRtti<T>.__GetRTTIPropertyValue(aEntity: T;
  aPropertyName: String): string;
begin
  Result := __GetRTTIProperty(aEntity, aPropertyName).GetValue(Pointer(aEntity)
    ).AsString;

end;

end.
