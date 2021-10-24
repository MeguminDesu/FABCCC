# FABCCC
Flesh and Blood, Custom Card Creator.

Currently requires [Processing](https://processing.org/download). to run,

Eventuall everything will be changable in the application, however i have not yet developed that part of the app, (It takes a while lol).
So To Change the current Card/Text, change the following variables in: "FAB_CCC_Card.pde":
- Title - Card name
- Text  - Text Box/Card Description
- Cost  - Cost of card
- Pitch - Pitch Value of Card (0, 1, 2, 3)

- Attack Value  - atkv
- Defence Value - defv

The tricky stuff comes to how to change the card background/frame.  
Theres alot of stuff going on behind the scenes with string building and image loactions, so please dont touch the main file if u dont want to break it <3  
To change the card type from "Action/Reaction" to "Hero" do the following: (also reverse)  
<br>
Change "Type" from "Action" to "Hero"  
Change the region to desired, Select From
- Aria
- Demon
- Mech
- Mist (Ninja)
- Savage
- SolanaS (Solana Special)
- Pits
- Volcor

Regarding classtype, This is what is displayed a the bottom center, along with actiontype, seperated by a "-",  
Changing this just changes the text at the bottom, so go crazy <3  
Ex. classtype = "Ninja Action" actiontype = "Attack".  
  - Displays: "Ninja Action - Attack"  
<br>
<br>
Thank you for downloading and testing, any feedback would be appreciated.
Eve <3
