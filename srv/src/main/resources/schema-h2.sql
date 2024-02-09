
DROP VIEW IF EXISTS localized_CostService_FreightCosts;
DROP VIEW IF EXISTS localized_CostService_FreightCostItems;
DROP VIEW IF EXISTS localized_CostService_UnitOfMeasure;
DROP VIEW IF EXISTS localized_CostService_ChargeCalculationLevels;
DROP VIEW IF EXISTS localized_CostService_Currencies;
DROP VIEW IF EXISTS localized_CostService_hostDocumentTypes;
DROP VIEW IF EXISTS CostService_DraftAdministrativeData;
DROP VIEW IF EXISTS localized_com_sap_ngl_ChargeType;
DROP VIEW IF EXISTS localized_com_sap_ngl_FreightCostItems;
DROP VIEW IF EXISTS localized_com_sap_ngl_FreightCosts;
DROP VIEW IF EXISTS localized_sap_common_Currencies;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_UnitOfMeasure;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_ChargeValueIndicators;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_ChargeSignIndicators;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_ChargeCategories;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_ChargeCalculationLevels;
DROP VIEW IF EXISTS localized_com_sap_ngl_common_hostDocumentTypes;
DROP VIEW IF EXISTS CostService_UnitOfMeasure_texts;
DROP VIEW IF EXISTS CostService_ChargeCalculationLevels_texts;
DROP VIEW IF EXISTS CostService_Currencies_texts;
DROP VIEW IF EXISTS CostService_hostDocumentTypes_texts;
DROP VIEW IF EXISTS CostService_UnitOfMeasure;
DROP VIEW IF EXISTS CostService_ChargeCalculationLevels;
DROP VIEW IF EXISTS CostService_Currencies;
DROP VIEW IF EXISTS CostService_hostDocumentTypes;
DROP VIEW IF EXISTS CostService_FreightCostItems;
DROP VIEW IF EXISTS CostService_FreightCosts;
DROP TABLE IF EXISTS CostService_FreightCostItems_drafts;
DROP TABLE IF EXISTS CostService_FreightCosts_drafts;
DROP TABLE IF EXISTS DRAFT_DraftAdministrativeData;
DROP TABLE IF EXISTS sap_common_Currencies_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_UnitOfMeasure_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeValueIndicators_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeSignIndicators_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeCategories_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeCalculationLevels_texts;
DROP TABLE IF EXISTS com_sap_ngl_common_hostDocumentTypes_texts;
DROP TABLE IF EXISTS sap_common_Currencies;
DROP TABLE IF EXISTS com_sap_ngl_ChargeType;
DROP TABLE IF EXISTS com_sap_ngl_FreightCostItems;
DROP TABLE IF EXISTS com_sap_ngl_FreightCosts;
DROP TABLE IF EXISTS com_sap_ngl_common_UnitOfMeasure;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeValueIndicators;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeSignIndicators;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeCategories;
DROP TABLE IF EXISTS com_sap_ngl_common_ChargeCalculationLevels;
DROP TABLE IF EXISTS com_sap_ngl_common_hostDocumentTypes;

CREATE TABLE com_sap_ngl_common_hostDocumentTypes (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(4) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_ChargeCalculationLevels (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(2) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_ChargeCategories (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_ChargeSignIndicators (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(1) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_ChargeValueIndicators (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(1) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_UnitOfMeasure (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_FreightCosts (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  hostDocumentType_code NVARCHAR(4),
  hostDocumentUUID NVARCHAR(36) NOT NULL,
  grossAmountInDocumentCurrency DECIMAL(28, 6),
  netAmountInDocumentCurrency DECIMAL(28, 6),
  documentCurrency_code NVARCHAR(3),
  PRIMARY KEY(ID)
); 

CREATE TABLE com_sap_ngl_FreightCostItems (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  chargeType_chargeType NVARCHAR(5),
  freightCostParent_ID NVARCHAR(36),
  chargeTypeDescription NVARCHAR(200),
  logisticalReference NVARCHAR(32),
  chargeCalculationLevel_code NVARCHAR(2),
  finalAmountInRateCurrency DECIMAL(28, 6),
  rateAmountInRateCurrency DECIMAL(28, 6),
  rateCurrency_code NVARCHAR(3),
  pricePerUnit DECIMAL(28, 6),
  pricePerUnitUoM_code NVARCHAR(3),
  logisticalQuantity DECIMAL(28, 6),
  logisticalQuantityUnitOfMeasure_code NVARCHAR(3),
  PRIMARY KEY(ID)
); 

CREATE TABLE com_sap_ngl_ChargeType (
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  chargeType NVARCHAR(5) NOT NULL,
  chargeTypeDescription NVARCHAR(200),
  chargeCategory_code NVARCHAR(3),
  chargeValueIndicator_code NVARCHAR(1),
  chargeSignIndicator_code NVARCHAR(1),
  chargeIsInactive BOOLEAN,
  PRIMARY KEY(chargeType)
); 

CREATE TABLE sap_common_Currencies (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  symbol NVARCHAR(5),
  minorUnit SMALLINT,
  PRIMARY KEY(code)
); 

CREATE TABLE com_sap_ngl_common_hostDocumentTypes_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(4) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE com_sap_ngl_common_ChargeCalculationLevels_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(2) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE com_sap_ngl_common_ChargeCategories_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE com_sap_ngl_common_ChargeSignIndicators_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(1) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE com_sap_ngl_common_ChargeValueIndicators_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(1) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE com_sap_ngl_common_UnitOfMeasure_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE sap_common_Currencies_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE DRAFT_DraftAdministrativeData (
  DraftUUID NVARCHAR(36) NOT NULL,
  CreationDateTime TIMESTAMP(7),
  CreatedByUser NVARCHAR(256),
  DraftIsCreatedByMe BOOLEAN,
  LastChangeDateTime TIMESTAMP(7),
  LastChangedByUser NVARCHAR(256),
  InProcessByUser NVARCHAR(256),
  DraftIsProcessedByMe BOOLEAN,
  PRIMARY KEY(DraftUUID)
); 

CREATE TABLE CostService_FreightCosts_drafts (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7) NULL,
  createdBy NVARCHAR(255) NULL,
  modifiedAt TIMESTAMP(7) NULL,
  modifiedBy NVARCHAR(255) NULL,
  hostDocumentType_code NVARCHAR(4) NULL,
  hostDocumentUUID NVARCHAR(36) NULL,
  grossAmountInDocumentCurrency DECIMAL(28, 6) NULL,
  netAmountInDocumentCurrency DECIMAL(28, 6) NULL,
  documentCurrency_code NVARCHAR(3) NULL,
  IsActiveEntity BOOLEAN,
  HasActiveEntity BOOLEAN,
  HasDraftEntity BOOLEAN,
  DraftAdministrativeData_DraftUUID NVARCHAR(36) NOT NULL,
  PRIMARY KEY(ID)
); 

CREATE TABLE CostService_FreightCostItems_drafts (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7) NULL,
  createdBy NVARCHAR(255) NULL,
  modifiedAt TIMESTAMP(7) NULL,
  modifiedBy NVARCHAR(255) NULL,
  chargeType_chargeType NVARCHAR(5) NULL,
  freightCostParent_ID NVARCHAR(36) NULL,
  chargeTypeDescription NVARCHAR(200) NULL,
  logisticalReference NVARCHAR(32) NULL,
  chargeCalculationLevel_code NVARCHAR(2) NULL,
  finalAmountInRateCurrency DECIMAL(28, 6) NULL,
  rateAmountInRateCurrency DECIMAL(28, 6) NULL,
  rateCurrency_code NVARCHAR(3) NULL,
  pricePerUnit DECIMAL(28, 6) NULL,
  pricePerUnitUoM_code NVARCHAR(3) NULL,
  logisticalQuantity DECIMAL(28, 6) NULL,
  logisticalQuantityUnitOfMeasure_code NVARCHAR(3) NULL,
  IsActiveEntity BOOLEAN,
  HasActiveEntity BOOLEAN,
  HasDraftEntity BOOLEAN,
  DraftAdministrativeData_DraftUUID NVARCHAR(36) NOT NULL,
  PRIMARY KEY(ID)
); 

CREATE VIEW CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocumentType_code,
  FreightCosts_0.hostDocumentUUID,
  FreightCosts_0.grossAmountInDocumentCurrency,
  FreightCosts_0.netAmountInDocumentCurrency,
  FreightCosts_0.documentCurrency_code
FROM com_sap_ngl_FreightCosts AS FreightCosts_0; 

CREATE VIEW CostService_FreightCostItems AS SELECT
  FreightCostItems_0.ID,
  FreightCostItems_0.createdAt,
  FreightCostItems_0.createdBy,
  FreightCostItems_0.modifiedAt,
  FreightCostItems_0.modifiedBy,
  FreightCostItems_0.chargeType_chargeType,
  FreightCostItems_0.freightCostParent_ID,
  FreightCostItems_0.chargeTypeDescription,
  FreightCostItems_0.logisticalReference,
  FreightCostItems_0.chargeCalculationLevel_code,
  FreightCostItems_0.finalAmountInRateCurrency,
  FreightCostItems_0.rateAmountInRateCurrency,
  FreightCostItems_0.rateCurrency_code,
  FreightCostItems_0.pricePerUnit,
  FreightCostItems_0.pricePerUnitUoM_code,
  FreightCostItems_0.logisticalQuantity,
  FreightCostItems_0.logisticalQuantityUnitOfMeasure_code
FROM com_sap_ngl_FreightCostItems AS FreightCostItems_0; 

CREATE VIEW CostService_hostDocumentTypes AS SELECT
  hostDocumentTypes_0.name,
  hostDocumentTypes_0.descr,
  hostDocumentTypes_0.code
FROM com_sap_ngl_common_hostDocumentTypes AS hostDocumentTypes_0; 

CREATE VIEW CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0; 

CREATE VIEW CostService_ChargeCalculationLevels AS SELECT
  ChargeCalculationLevels_0.name,
  ChargeCalculationLevels_0.descr,
  ChargeCalculationLevels_0.code
FROM com_sap_ngl_common_ChargeCalculationLevels AS ChargeCalculationLevels_0; 

CREATE VIEW CostService_UnitOfMeasure AS SELECT
  UnitOfMeasure_0.name,
  UnitOfMeasure_0.descr,
  UnitOfMeasure_0.code
FROM com_sap_ngl_common_UnitOfMeasure AS UnitOfMeasure_0; 

CREATE VIEW CostService_hostDocumentTypes_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM com_sap_ngl_common_hostDocumentTypes_texts AS texts_0; 

CREATE VIEW CostService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0; 

CREATE VIEW CostService_ChargeCalculationLevels_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM com_sap_ngl_common_ChargeCalculationLevels_texts AS texts_0; 

CREATE VIEW CostService_UnitOfMeasure_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM com_sap_ngl_common_UnitOfMeasure_texts AS texts_0; 

CREATE VIEW localized_com_sap_ngl_common_hostDocumentTypes AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_hostDocumentTypes AS L_0 LEFT JOIN com_sap_ngl_common_hostDocumentTypes_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_common_ChargeCalculationLevels AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_ChargeCalculationLevels AS L_0 LEFT JOIN com_sap_ngl_common_ChargeCalculationLevels_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_common_ChargeCategories AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_ChargeCategories AS L_0 LEFT JOIN com_sap_ngl_common_ChargeCategories_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_common_ChargeSignIndicators AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_ChargeSignIndicators AS L_0 LEFT JOIN com_sap_ngl_common_ChargeSignIndicators_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_common_ChargeValueIndicators AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_ChargeValueIndicators AS L_0 LEFT JOIN com_sap_ngl_common_ChargeValueIndicators_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_common_UnitOfMeasure AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code
FROM (com_sap_ngl_common_UnitOfMeasure AS L_0 LEFT JOIN com_sap_ngl_common_UnitOfMeasure_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_sap_common_Currencies AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_com_sap_ngl_FreightCosts AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.hostDocumentType_code,
  L.hostDocumentUUID,
  L.grossAmountInDocumentCurrency,
  L.netAmountInDocumentCurrency,
  L.documentCurrency_code
FROM com_sap_ngl_FreightCosts AS L; 

CREATE VIEW localized_com_sap_ngl_FreightCostItems AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.chargeType_chargeType,
  L.freightCostParent_ID,
  L.chargeTypeDescription,
  L.logisticalReference,
  L.chargeCalculationLevel_code,
  L.finalAmountInRateCurrency,
  L.rateAmountInRateCurrency,
  L.rateCurrency_code,
  L.pricePerUnit,
  L.pricePerUnitUoM_code,
  L.logisticalQuantity,
  L.logisticalQuantityUnitOfMeasure_code
FROM com_sap_ngl_FreightCostItems AS L; 

CREATE VIEW localized_com_sap_ngl_ChargeType AS SELECT
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.chargeType,
  L.chargeTypeDescription,
  L.chargeCategory_code,
  L.chargeValueIndicator_code,
  L.chargeSignIndicator_code,
  L.chargeIsInactive
FROM com_sap_ngl_ChargeType AS L; 

CREATE VIEW CostService_DraftAdministrativeData AS SELECT
  DraftAdministrativeData.DraftUUID,
  DraftAdministrativeData.CreationDateTime,
  DraftAdministrativeData.CreatedByUser,
  DraftAdministrativeData.DraftIsCreatedByMe,
  DraftAdministrativeData.LastChangeDateTime,
  DraftAdministrativeData.LastChangedByUser,
  DraftAdministrativeData.InProcessByUser,
  DraftAdministrativeData.DraftIsProcessedByMe
FROM DRAFT_DraftAdministrativeData AS DraftAdministrativeData; 

CREATE VIEW localized_CostService_hostDocumentTypes AS SELECT
  hostDocumentTypes_0.name,
  hostDocumentTypes_0.descr,
  hostDocumentTypes_0.code
FROM localized_com_sap_ngl_common_hostDocumentTypes AS hostDocumentTypes_0; 

CREATE VIEW localized_CostService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_CostService_ChargeCalculationLevels AS SELECT
  ChargeCalculationLevels_0.name,
  ChargeCalculationLevels_0.descr,
  ChargeCalculationLevels_0.code
FROM localized_com_sap_ngl_common_ChargeCalculationLevels AS ChargeCalculationLevels_0; 

CREATE VIEW localized_CostService_UnitOfMeasure AS SELECT
  UnitOfMeasure_0.name,
  UnitOfMeasure_0.descr,
  UnitOfMeasure_0.code
FROM localized_com_sap_ngl_common_UnitOfMeasure AS UnitOfMeasure_0; 

CREATE VIEW localized_CostService_FreightCostItems AS SELECT
  FreightCostItems_0.ID,
  FreightCostItems_0.createdAt,
  FreightCostItems_0.createdBy,
  FreightCostItems_0.modifiedAt,
  FreightCostItems_0.modifiedBy,
  FreightCostItems_0.chargeType_chargeType,
  FreightCostItems_0.freightCostParent_ID,
  FreightCostItems_0.chargeTypeDescription,
  FreightCostItems_0.logisticalReference,
  FreightCostItems_0.chargeCalculationLevel_code,
  FreightCostItems_0.finalAmountInRateCurrency,
  FreightCostItems_0.rateAmountInRateCurrency,
  FreightCostItems_0.rateCurrency_code,
  FreightCostItems_0.pricePerUnit,
  FreightCostItems_0.pricePerUnitUoM_code,
  FreightCostItems_0.logisticalQuantity,
  FreightCostItems_0.logisticalQuantityUnitOfMeasure_code
FROM localized_com_sap_ngl_FreightCostItems AS FreightCostItems_0; 

CREATE VIEW localized_CostService_FreightCosts AS SELECT
  FreightCosts_0.ID,
  FreightCosts_0.createdAt,
  FreightCosts_0.createdBy,
  FreightCosts_0.modifiedAt,
  FreightCosts_0.modifiedBy,
  FreightCosts_0.hostDocumentType_code,
  FreightCosts_0.hostDocumentUUID,
  FreightCosts_0.grossAmountInDocumentCurrency,
  FreightCosts_0.netAmountInDocumentCurrency,
  FreightCosts_0.documentCurrency_code
FROM localized_com_sap_ngl_FreightCosts AS FreightCosts_0; 

