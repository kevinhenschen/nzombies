nZombies
========
ORIGINAL README.md : https://github.com/Zet0rz/nzombies/blob/master-workshop/README.md

THIS README EXTENDS IS A BETA (***IMPROVED AND MORE BEAUTIFUL VERSION TO COME! :)***)

# Dillinger
# New Features!

  - You can add custom "mp3 / wav / png" in depend of the select map !


Advantages :
  - No Code !
  - More Faster !
  - no knowledge of LUA required!

### HOW TO DO ?!
I have an SCP themed map! I want to make some design / sound modifications to make it more believable!

For it:

* [**scp_map**] - This is my map named !
* [**Jugger Icon**] - I Want to change this icon !
* [**Jugger Jingle**] - I Want to change this jingle !!
* [**I HAVE ALREADY ALL FILES NEEDED**] - ***WARNING ! YOU NEED TO HAVE SAME FREQUENCY AND FORMAT TO WORK PROPELY (FOR MUSIC), AND SAME ASPECT RATIO / FORMAT FOR IMAGE***

Let's go !

### STEP 1 - FIND THE DEFAUT ICON NAME

GO TO :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies\gamemodes\nzombies\gamemode\customconfig\default***

AND FIND :

```sh
sh_cnf_lang_default.lua (***FOR LANGUAGE / SCRIPT TEXT // NOT RELEASE FOR MOMENT !!***)
sh_cnf_mat_default.lua (*** FOR MATERIAL ***)
sh_cnf_snd_default.lua (*** FOR SOUND // WARNING : ALL SOUND FILES WAS NOT CORRECTLY IMPLEMENTS : EXAMPLE > SOME SOUND USE RANDOM LOGIC TO FIND AND NOT ONLY RAW SOUND FILENAME TO WORK)
```

***OK ! I WANT TO CHANGE MATERIAL : I OPEN (sh_cnf_mat_default.lua) AND I SEARCH JUGGER ICON !!!***
***FIND IT ! :D ==> NZOMBIES_VARS.MATERIALS.PERK_ICONS.JUGG = "perk_icons/jugg.png"***

I COPY IT AND I GO IN :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies\gamemodes\nzombies\gamemode\customconfig*** 

I CREATE A FOLDER :
***IF YOU MAP NAMED "scp_map" AND CREATE A "scpmap" FOLDER***

OK ! NOW CREATE A FILE IN THIS FOLDER **(YOU MUST NEVER LEAVE AN EMPTY FILE !!!)** :
***sh_cnf_mat.lua (for materials)***

NOW ... RETURN IN ADDON FOLDER :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons***

AND CREATE A FOLDER :
***Example : C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies_scpmap***

FILL THIS FOLDER WITH : 
***Material Folder (Like this) : C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies_scpmap\materials***

OK ! NOW CREATE A FOLDER IN YOU'RE MATERIALS FOLDER LIKE THIS :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies_scpmap\materials\scpmap***

AND PASTE YOU'RE PNG IN THIS FOLDER :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies_scpmap\materials\scpmap\jugg.png***

NOW RETURN AND OPEN :
***C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies\gamemodes\nzombies\gamemode\customconfig\scpmap\sh_cnf_mat.lua*** 

PASTE THE PREVIOUS VARIABLE (**NZOMBIES_VARS.MATERIALS.PERK_ICONS.JUGG = "perk_icons/jugg.png**) AND CHANGE THIS TO :
***NZOMBIES_VARS.MATERIALS.PERK_ICONS.JUGG = "scpmap/jugg.png***

***HOW TO DETERMINATE THIS ? [scpmap/jugg.png] ???***
***START : C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\nzombies_scpmap\materials\scpmap\jugg.png***
***AND YOU HAVE : scpmap\jugg.png [this is how i found the emplacement of my material]***

SAVE FILE AND RESTART GMOD ! 


