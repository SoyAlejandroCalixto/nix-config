{ ... }:

{
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems = {
    "/mnt/disco2nd" = {
      device = "/dev/disk/by-uuid/8EE492C6E492AFC7";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };
  };
}
