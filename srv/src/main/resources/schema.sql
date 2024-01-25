
DROP VIEW IF EXISTS localized_fr_CostService_CostItems;
DROP VIEW IF EXISTS localized_de_CostService_CostItems;
DROP VIEW IF EXISTS localized_fr_CostService_FreightCosts;
DROP VIEW IF EXISTS localized_de_CostService_FreightCosts;
DROP VIEW IF EXISTS localized_fr_CostService_Currencies;
DROP VIEW IF EXISTS localized_de_CostService_Currencies;
DROP VIEW IF EXISTS localized_fr_com_sap_ngl_CostItems;
DROP VIEW IF EXISTS localized_de_com_sap_ngl_CostItems;
DROP VIEW IF EXISTS localized_fr_com_sap_ngl_FreightCosts;
DROP VIEW IF EXISTS localized_de_com_sap_ngl_FreightCosts;
DROP VIEW IF EXISTS localized_fr_sap_common_Currencies;
DROP VIEW IF EXISTS localized_de_sap_common_Currencies;
DROP VIEW IF EXISTS localized_CostService_CostItems;
DROP VIEW IF EXISTS localized_CostService_FreightCosts;
DROP VIEW IF EXISTS localized_CostService_Currencies;
DROP VIEW IF EXISTS localized_com_sap_ngl_CostItems;
DROP VIEW IF EXISTS localized_com_sap_ngl_FreightCosts;
DROP VIEW IF EXISTS localized_sap_common_Currencies;
DROP VIEW IF EXISTS CostService_Currencies_texts;
DROP VIEW IF EXISTS CostService_Currencies;
DROP VIEW IF EXISTS CostService_CostItems;
DROP VIEW IF EXISTS CostService_FreightCosts;
DROP TABLE IF EXISTS sap_common_Currencies_texts;
DROP TABLE IF EXISTS sap_common_Currencies;
DROP TABLE IF EXISTS com_sap_ngl_CostItems;
DROP TABLE IF EXISTS com_sap_ngl_FreightCosts;

CREATE TABLE com_sap_ngl_FreightCosts (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  hostDocument NVARCHAR(10) NOT NULL,
  hostDocumentType NVARCHAR(4) NOT NULL,
  grossAmount DECIMAL(9, 2) DEFAULT 0,
  netAmount DECIMAL(9, 2) DEFAULT 0,
  currency_code NVARCHAR(3),
  PRIMARY KEY(ID)
); 

CREATE TABLE com_sap_ngl_CostItems (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  parent_ID NVARCHAR(36) NOT NULL,
  itemNumber SMALLINT,
  chargeType NVARCHAR(255),
  chargeTypeDescription NVARCHAR(255),
  chargeCalculationLevel NVARCHAR(255),
  rate DECIMAL(9, 2),
  quantity DECIMAL(9, 2),
  finalAmount DECIMAL(9, 2),
  currency_code NVARCHAR(3),
  unitOfMeasure NVARCHAR(3),
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_common_Currencies (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  symbol NVARCHAR(5),
  minorUnit SMALLINT,
  PRIMARY KEY(code)
); 

CREATE TABLE sap_common_Currencies_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE VIEW CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocument,
  FreightCosts_0.hostDocumentType,
  FreightCosts_0.grossAmount,
  FreightCosts_0.netAmount,
  FreightCosts_0.currency_code
FROM com_sap_ngl_FreightCosts AS FreightCosts_0; 

CREATE VIEW CostService_CostItems AS SELECT
  CostItems_0.ID,
  CostItems_0.createdAt,
  CostItems_0.createdBy,
  CostItems_0.modifiedAt,
  CostItems_0.modifiedBy,
  CostItems_0.parent_ID,
  CostItems_0.itemNumber,
  CostItems_0.chargeType,
  CostItems_0.chargeTypeDescription,
  CostItems_0.chargeCalculationLevel,
  CostItems_0.rate,
  CostItems_0.quantity,
  CostItems_0.finalAmount,
  CostItems_0.currency_code,
  CostItems_0.unitOfMeasure
FROM com_sap_ngl_CostItems AS CostItems_0; 

CREATE VIEW CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0; 

CREATE VIEW CostService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0; 

CREATE VIEW localized_sap_common_Currencies AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = 'en'); 

CREATE VIEW localized_com_sap_ngl_FreightCosts AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.hostDocument,
  L.hostDocumentType,
  L.grossAmount,
  L.netAmount,
  L.currency_code
FROM com_sap_ngl_FreightCosts AS L; 

CREATE VIEW localized_com_sap_ngl_CostItems AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.parent_ID,
  L.itemNumber,
  L.chargeType,
  L.chargeTypeDescription,
  L.chargeCalculationLevel,
  L.rate,
  L.quantity,
  L.finalAmount,
  L.currency_code,
  L.unitOfMeasure
FROM com_sap_ngl_CostItems AS L; 

CREATE VIEW localized_CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocument,
  FreightCosts_0.hostDocumentType,
  FreightCosts_0.grossAmount,
  FreightCosts_0.netAmount,
  FreightCosts_0.currency_code
FROM localized_com_sap_ngl_FreightCosts AS FreightCosts_0; 

CREATE VIEW localized_CostService_CostItems AS SELECT
  CostItems_0.ID,
  CostItems_0.createdAt,
  CostItems_0.createdBy,
  CostItems_0.modifiedAt,
  CostItems_0.modifiedBy,
  CostItems_0.parent_ID,
  CostItems_0.itemNumber,
  CostItems_0.chargeType,
  CostItems_0.chargeTypeDescription,
  CostItems_0.chargeCalculationLevel,
  CostItems_0.rate,
  CostItems_0.quantity,
  CostItems_0.finalAmount,
  CostItems_0.currency_code,
  CostItems_0.unitOfMeasure
FROM localized_com_sap_ngl_CostItems AS CostItems_0; 

CREATE VIEW localized_de_sap_common_Currencies AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = 'de'); 

CREATE VIEW localized_fr_sap_common_Currencies AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = 'fr'); 

CREATE VIEW localized_de_com_sap_ngl_FreightCosts AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.hostDocument,
  L.hostDocumentType,
  L.grossAmount,
  L.netAmount,
  L.currency_code
FROM com_sap_ngl_FreightCosts AS L; 

CREATE VIEW localized_fr_com_sap_ngl_FreightCosts AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.hostDocument,
  L.hostDocumentType,
  L.grossAmount,
  L.netAmount,
  L.currency_code
FROM com_sap_ngl_FreightCosts AS L; 

CREATE VIEW localized_de_com_sap_ngl_CostItems AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.parent_ID,
  L.itemNumber,
  L.chargeType,
  L.chargeTypeDescription,
  L.chargeCalculationLevel,
  L.rate,
  L.quantity,
  L.finalAmount,
  L.currency_code,
  L.unitOfMeasure
FROM com_sap_ngl_CostItems AS L; 

CREATE VIEW localized_fr_com_sap_ngl_CostItems AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.parent_ID,
  L.itemNumber,
  L.chargeType,
  L.chargeTypeDescription,
  L.chargeCalculationLevel,
  L.rate,
  L.quantity,
  L.finalAmount,
  L.currency_code,
  L.unitOfMeasure
FROM com_sap_ngl_CostItems AS L; 

CREATE VIEW localized_de_CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_de_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_fr_CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_fr_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_de_CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocument,
  FreightCosts_0.hostDocumentType,
  FreightCosts_0.grossAmount,
  FreightCosts_0.netAmount,
  FreightCosts_0.currency_code
FROM localized_de_com_sap_ngl_FreightCosts AS FreightCosts_0; 

CREATE VIEW localized_fr_CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocument,
  FreightCosts_0.hostDocumentType,
  FreightCosts_0.grossAmount,
  FreightCosts_0.netAmount,
  FreightCosts_0.currency_code
FROM localized_fr_com_sap_ngl_FreightCosts AS FreightCosts_0; 

CREATE VIEW localized_de_CostService_CostItems AS SELECT
  CostItems_0.ID,
  CostItems_0.createdAt,
  CostItems_0.createdBy,
  CostItems_0.modifiedAt,
  CostItems_0.modifiedBy,
  CostItems_0.parent_ID,
  CostItems_0.itemNumber,
  CostItems_0.chargeType,
  CostItems_0.chargeTypeDescription,
  CostItems_0.chargeCalculationLevel,
  CostItems_0.rate,
  CostItems_0.quantity,
  CostItems_0.finalAmount,
  CostItems_0.currency_code,
  CostItems_0.unitOfMeasure
FROM localized_de_com_sap_ngl_CostItems AS CostItems_0; 

CREATE VIEW localized_fr_CostService_CostItems AS SELECT
  CostItems_0.ID,
  CostItems_0.createdAt,
  CostItems_0.createdBy,
  CostItems_0.modifiedAt,
  CostItems_0.modifiedBy,
  CostItems_0.parent_ID,
  CostItems_0.itemNumber,
  CostItems_0.chargeType,
  CostItems_0.chargeTypeDescription,
  CostItems_0.chargeCalculationLevel,
  CostItems_0.rate,
  CostItems_0.quantity,
  CostItems_0.finalAmount,
  CostItems_0.currency_code,
  CostItems_0.unitOfMeasure
FROM localized_fr_com_sap_ngl_CostItems AS CostItems_0; 

