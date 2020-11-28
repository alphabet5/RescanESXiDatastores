#rescans the datastore until the datastore is present that matches "freenas" in this example.
#"freenas" should be replaced with the name of the SAN datastore.
while [ ! $(echo "$(esxcli storage vmfs extent list)" | awk /freenas/ ) ];
do echo 'scanning...';
esxcli storage core adapter rescan --all;
vmkfstools -V;
sleep 10;
done;

#after storage shows as present, then loop through all VM's and power them on.
for vmid in $(vim-cmd vmsvc/getallvm | cut -d " " -f 1 | sed -n '1!p') ;
do if [ "$(vim-cmd vmsvc/power.getstate $vmid)" = $'Retrieved runtime info\nPowered off' ] ;
then vim-cmd vmsvc/power.on $vmid;
fi;
done;
exit 0
