col_floors = engineLoadCOL ( "podloga.col" )
engineReplaceCOL ( col_floors, 16345 )
txd_floors = engineLoadTXD ( "podloga.txd" )
engineImportTXD ( txd_floors, 16345 )
dff_floors = engineLoadDFF ( "podloga.dff" )
engineReplaceModel ( dff_floors, 16345 )