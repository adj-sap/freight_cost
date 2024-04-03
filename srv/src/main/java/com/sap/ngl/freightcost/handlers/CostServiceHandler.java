package com.sap.ngl.freightcost.handlers;

import java.math.BigDecimal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.ErrorStatuses;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.com.sap.dsc.lgm.service.costdomainservice.*;

@Component
@ServiceName(CostDomainService_.CDS_NAME)
public class CostServiceHandler implements EventHandler {
    
    @Autowired
    PersistenceService db;

    Logger logger = LoggerFactory.getLogger(CostServiceHandler.class);

    @After(event = CqnService.EVENT_CREATE, entity = FreightCostItems_.CDS_NAME)
    // Lets create a method to sum up all the cost items and update the total cost
    // in the freight cost entity
    public void calculateTotalCost(List<FreightCostItems> costItems) {
        // Get the freight cost id from the cost items
        logger.info("CostServiceHandler");
        for (FreightCostItems costItem : costItems) {
        String freightCostId = costItem.getFreightCostParentId();

            CqnSelect sel = Select.from(FreightCosts_.class).columns(b -> b.grossAmountInDocumentCurrency())
                    .where(b -> b.ID().eq(freightCostId));
            FreightCosts freightCosts = db.run(sel).first(FreightCosts.class)
                    .orElseThrow(() -> new ServiceException(ErrorStatuses.NOT_FOUND, "Header does not exist"));

            BigDecimal amount = costItem.getFinalAmountInRateCurrency();
            if (freightCosts.getGrossAmountInDocumentCurrency() == null) {
                freightCosts.setGrossAmountInDocumentCurrency(amount);
                freightCosts.setNetAmountInDocumentCurrency(amount);
            } else {
                amount = amount.add(freightCosts.getGrossAmountInDocumentCurrency());
                freightCosts.setGrossAmountInDocumentCurrency(amount);
                freightCosts.setNetAmountInDocumentCurrency(amount);
            }
            CqnUpdate update = Update.entity(FreightCosts_.class).data(freightCosts)
                    .where(b -> b.ID().eq(freightCostId));
            db.run(update);
        }
    }

    @After(event = CqnService.EVENT_CREATE, entity = FreightCosts_.CDS_NAME)
    public void calculateTotalCostViaFreightCost(List<FreightCosts> freightCosts) {
        for (FreightCosts freightCost : freightCosts) {
            if (freightCost.getToFreightCostItem() != null) {
                calculateTotalCost(freightCost.getToFreightCostItem());
            }
        }
    }

    @On( entity = FreightCosts_.CDS_NAME)
    public void readCarrierCharges(CdsReadEventContext context) {
            logger.info("Read Event triggered for Cost Header");
    }

    @On( entity = FreightCostItems_.CDS_NAME)
    public void readCostItems(CdsReadEventContext context) {
            logger.info("Read Event triggered for Cost Item");
    }
}