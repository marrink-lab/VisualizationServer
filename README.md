# VisualizationServer
Managing all user guides, issues and suggestions regarding the Visualization Server. This tracking is meant for users of the Molecular Dynamics group or users part of the University of Groningen.

### CURRENT STATUS = MAINTENANCE

## Proper usage
Current usage of the VisualizationServer for everyone occurs in a non-forced scheduled manner. For the Molecular Dynamics group we advice booking the server in advance using the MD group calender (a booked person always has priority over a non-booked user!). The server is available during the day and at night with a maxicum consecutive session of 24 hours. Please keep in mind that as long as you are using the service, nobody else can use it. This means that keeping a session open without actual usage is regarded unwanted. Therefore it is important to log out and close your session whenever you are done with using the service. The computer has some local storage available which you can use during processing (using the raid NVMe drives should result in very fast I/O). CIT has not scripted cleanup yet, so clean up all local storage if you will not be needing it anymore in the near future.

## Starting the service
If you go to: https://nice.hpc.rug.nl, click on "views" and login with your pnumber, you should see a button called "Lab01".
When clicked, this will queue an interactive session (so you have to wait a minute for it to startup). 
It will stay on pending a bit longer then it really is (I assume a refresh thing) but if you click on the expand button below the pending message/screenshot and then click on details it will show you its running.

You then can click on the screen and it will open a new browser with the interactive session.

**Current local drives**
* /local  11TB of spinning disks (6x 2TB in raid0)
* /nvme 12TB of nvme disks (4x 3.2TB in raid0) (should be extremely fast)

## How to raise issues
Each issue is to be raised using the GIT issue tracker at the top of this page. Make sure you use an informative title and always start your issue with a short description of what your were doing. For proper tracking it is important to flag your issues accordingly using the flag system on the right of the issue page. Different flags could be one or more of the following: bug, suggestion, question, etc. Keep in mind that adding the error message and a reproduction method is extremely useful for resolving the issue efficiently. Before posing a new issue, please do a quick scan through the issues to see if an issue similar to yours has been raised already, if so, add your issue as a comment to the already existing one.

## Current machine specifications
* 2x Intel Xeon Gold 6148 2.4GHz, 20C/40T, 10.4GT/s 2UPI, 27M Cache, Turbo, HT (150W) DDR4-2666 
* 2x PNY NVIDIA RTX-8000 NVLINK (2x48 GB extended VRAM)
* 24x 64GB LRDIMM, 2667MT/s, Quad Rank (1.5 TB)
* 1x 1 Intel X710 Dual Port 10Gb Direct Attach, SFP+
* 4x 3.2TB NVME in raid0 (/nvme)
* Direct acces to the Peregrine storage (/home, /data, /scratch)
