package com.sap.ngl.freightcost.handlers;

import org.springframework.beans.factory.annotation.Qualifier;

import com.sap.cds.Result;
import com.sap.cds.services.cds.ApplicationService;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CdsDeleteEventContext;
import com.sap.cds.services.cds.CdsUpdateEventContext;
import com.sap.cds.services.cds.CdsUpsertEventContext;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.com.sap.dsc.lgm.service.costdomainservice.*;
import cds.gen.costapiservice.*;
import cds.gen.costuiservice.*;

@ServiceName({CostUiService_.CDS_NAME , CostApiService_.CDS_NAME})
public class CostServiceDelegator {
    private final ApplicationService ds;

    CostServiceDelegator(
        @Qualifier(CostDomainService_.CDS_NAME) ApplicationService ds) {
        this.ds = ds;
    }
   
    @On
    Result delegateCreate(CdsCreateEventContext context) {
        return ds.run(DraftStatementPreprocessor.draftless(context.getCqn()).asInsert());
    }
 
    @On
    Result delegateUpsert(CdsUpsertEventContext context) {
        return ds.run(DraftStatementPreprocessor.draftless(context.getCqn()).asUpsert());
    }
 
    @On
    Result delegateUpdate(CdsUpdateEventContext context) {
        return ds.run(DraftStatementPreprocessor.draftless(context.getCqn()).asUpdate(), context.getCqnValueSets());
    }
 
    @On
    Result delegateDelete(CdsDeleteEventContext context) {
        return ds.run(DraftStatementPreprocessor.draftless(context.getCqn()).asDelete(), context.getCqnValueSets());
    }
}
