@isTest
public class BoMDistiComparerTest {
    @isTest
    static void testCompareBoMAndDisti() {
        List<Map<String, Object>> BoM = new List<Map<String, Object>>();
        List<Map<String, Object>> Disti = new List<Map<String, Object>>();
        
        // Test data for BoM
        BoM.add(new Map<String, Object>{'Part Number' => 'ABC', 'Quantity' => 2});
        BoM.add(new Map<String, Object>{'Part Number' => 'XYZ', 'Quantity' => 1});
        BoM.add(new Map<String, Object>{'Part Number' => 'IJK', 'Quantity' => 1});
        BoM.add(new Map<String, Object>{'Part Number' => 'ABC', 'Quantity' => 1});
        BoM.add(new Map<String, Object>{'Part Number' => 'IJK', 'Quantity' => 1});
        BoM.add(new Map<String, Object>{'Part Number' => 'XYZ', 'Quantity' => 2});
        BoM.add(new Map<String, Object>{'Part Number' => 'DEF', 'Quantity' => 2});
        
        // Test data for Disti
        Disti.add(new Map<String, Object>{'Part Number' => 'XYZ', 'Quantity' => 2});
        Disti.add(new Map<String, Object>{'Part Number' => 'GEF', 'Quantity' => 2});
        Disti.add(new Map<String, Object>{'Part Number' => 'ABC', 'Quantity' => 4});
        Disti.add(new Map<String, Object>{'Part Number' => 'IJK', 'Quantity' => 2});
        
        List<BoMDistiComparer.UnifiedListItem> unifiedList = BoMDistiComparer.compareBoMAndDisti(BoM, Disti);
        
        for (BoMDistiComparer.UnifiedListItem item : unifiedList) {
            System.debug('bom_pn: ' + item.bom_pn + ', bom_qty: ' + item.bom_qty
                         + ', disti_pn: ' + item.disti_pn + ', disti_qty: ' + item.disti_qty
                         + ', errorFlag: ' + item.errorFlag);
        }
    }
}