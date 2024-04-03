package com.sap.ngl.freightcost.handlers;

import com.sap.cds.ql.*;
import com.sap.cds.ql.cqn.*;
import com.sap.cds.services.draft.Drafts;
import java.util.List;
 
/** Utility class for preprocessing CQN statements before delegating to domain services. */
public class DraftStatementPreprocessor {
 
    private DraftStatementPreprocessor() {
        throw new IllegalStateException("This is a utility that cannot be instantiated");
    }
 
    /**
     * Removes draft-specific elements (e.g. IsActiveEntity) from where conditions and entity
     * references. This is the case for the entity reference itself and where conditions that are
     * applied by instance authorizations.
     *
     * @param statement Statement that may contain draft references
     * @return Cqn statement without draft elements
     */
    public static CqnStatement draftless(CqnStatement statement) {
        // See this for details on query modification: https://cap.cloud.sap/docs/java/query-api#modify-where
 
        return CQL.copy(statement, new Modifier() {
                @Override
                public Predicate where(Predicate predicate) {
                    if (predicateContainsDraftElement(predicate)) {
                        return null;
                    } else {
                        return predicate;
                    }
                }
 
                @Override
                public CqnPredicate connective(
                        CqnConnectivePredicate.Operator op, List<Predicate> predicates) {
                    var cleanedPredicates = predicates.stream()
                                    .filter(predicate -> !predicateContainsDraftElement(predicate))
                                    .toList();
                    return Modifier.super.connective(op, cleanedPredicates);
                }
 
                @Override
                public CqnStructuredTypeRef ref(CqnStructuredTypeRef ref) {
                    RefBuilder<StructuredTypeRef> copy = CQL.copy(ref);
 
                    var modifier = this;
                    copy.segments().forEach(
                        segment -> {
                            if (segment.filter().isEmpty()) {
                                return;
                            }
 
                            var predicate = segment.filter().get().as(Predicate.class);
 
                            if (predicateContainsDraftElement(predicate)) {
                                segment.filter(null);
                                return;
                            }
 
                            if (predicate instanceof CqnConnectivePredicate connective) {
                                var predicates =
                                        connective.predicates().stream().map(p -> (Predicate) p).toList();
                                var filter = modifier.connective(connective.operator(), predicates);
                                segment.filter(filter);
                            }
                        });
                    return copy.build();
                }
        });
    }
 
    private static boolean predicateContainsDraftElement(Predicate predicate) {
        if (!(predicate instanceof CqnComparisonPredicate)) return false;
        var comparison = predicate.as(CqnComparisonPredicate.class);
        return elementIsDraftElement(comparison.left()) || elementIsDraftElement(comparison.right());
    }
 
    private static final List<String> DRAFT_ELEMENT_NAMES =
            List.of(Drafts.IS_ACTIVE_ENTITY, Drafts.HAS_ACTIVE_ENTITY, Drafts.HAS_DRAFT_ENTITY);
 
    private static boolean elementIsDraftElement(CqnValue val) {
        if (val.isRef()) {
            return DRAFT_ELEMENT_NAMES.contains(val.asRef().targetSegment().id());
        } else {
            return false;
        }
    }
}
