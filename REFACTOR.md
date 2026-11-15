# Refactoring my dev setup

Includes repo ../machine_setup


## Problems

- Setup on new workstations works decently well but still need to install lots of tools (for example on CentOS).
  - Tools like fzf, ...
- At work I will usually work on different machines (ssh into VMs). I would like to have the same tools and work env available on every machine (quick one-time setup is ok)
  - Sometimes, home on some machines is limited to 2GB or something, and I need to install my stuff somewhere in a mounted NFS. (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). (so all symlinks should consider that). 
- Ideally, setup would be launching one script and everything works the same, no matter the OS. 

Would pixi or docker help out here? Pros and cons of each...?
