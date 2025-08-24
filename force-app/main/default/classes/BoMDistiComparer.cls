public class BoMDistiComparer {
    public class UnifiedListItem {
        public String bom_pn { get; set; }
        public Decimal bom_qty { get; set; }
        public String disti_pn { get; set; }
        public Decimal disti_qty { get; set; }
        public Boolean errorFlag { get; set; }
    }
    
    public static List<UnifiedListItem> compareBoMAndDisti(List<Map<String, Object>> BoM, List<Map<String, Object>> Disti) {
        List<UnifiedListItem> unifiedList = new List<UnifiedListItem>();
        Map<String, Decimal> distiMap = new Map<String, Decimal>();
        
        for (Map<String, Object> distiItem : Disti) {
            String pn = String.valueOf(distiItem.get('Part Number'));
            Decimal qty = (Decimal)distiItem.get('Quantity');
            
            if (distiMap.containsKey(pn)) {
                distiMap.put(pn, distiMap.get(pn) + qty);
            } else {
                distiMap.put(pn, qty);
            }
        }
        
        for (Map<String, Object> bomItem : BoM) {
            UnifiedListItem unifiedItem = new UnifiedListItem();
            unifiedItem.bom_pn = String.valueOf(bomItem.get('Part Number'));
            unifiedItem.bom_qty = (Decimal)bomItem.get('Quantity');
            
            if (distiMap.containsKey(unifiedItem.bom_pn)) {
                Decimal distiQty = distiMap.get(unifiedItem.bom_pn);
                
                if (distiQty >= unifiedItem.bom_qty) {
                    unifiedItem.disti_pn = unifiedItem.bom_pn;
                    unifiedItem.disti_qty = unifiedItem.bom_qty;
                    distiMap.put(unifiedItem.bom_pn, distiQty - unifiedItem.bom_qty);
                } else {
                    unifiedItem.disti_pn = unifiedItem.bom_pn;
                    unifiedItem.disti_qty = distiQty;
                    distiMap.put(unifiedItem.bom_pn, 0);
                    unifiedItem.errorFlag = true;
                    
                    Decimal remainingQty = unifiedItem.bom_qty - distiQty;
                    for (String otherPn : distiMap.keySet()) {
                        Decimal otherQty = distiMap.get(otherPn);
                        if (otherQty >= remainingQty) {
                            unifiedItem.disti_pn = otherPn;
                            unifiedItem.disti_qty += remainingQty;
                            distiMap.put(otherPn, otherQty - remainingQty);
                            break;
                        } else {
                            unifiedItem.disti_pn = otherPn;
                            unifiedItem.disti_qty += otherQty;
                            distiMap.put(otherPn, 0);
                            remainingQty -= otherQty;
                        }
                    }
                }
            } else {
                unifiedItem.errorFlag = true;
            }
            
            unifiedList.add(unifiedItem);
        }
        
        return unifiedList;
    }
}