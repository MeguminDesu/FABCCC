
PFont FABCCC_Title;
PFont FABCCC_Text;

int cardx, cardy;
int cardbufferx, cardbuffery;

Input currentInput = null;

Card card;

public void setup()
{
  // Load Fonts
  FABCCC_Title = createFont(".\\font\\cardtitle.otf", 32);
  FABCCC_Text  = createFont(".\\font\\cardtext.otf", 16);

  // Setup Screen
  size(1600, 900); background(0);

  cardx = 450;
  cardy = 628;

  cardbufferx = 50;
  cardbuffery = (height-cardy)/2;

  // Setup Base/Default Card
  card = new Card(
    new PVector(cardbufferx, cardbuffery),
    new PVector(cardx, cardy)
  );

  card.border = getImageFromValues(card);
}


public void draw()
{  background(127);
  // Draw Input Boxes


  // Draw Updated Card
  card.render();
}

// String Builder Vars

String sb_start = "img\\";

String sb_class = "class_frame\\";
String sb_hero  = "hero_frame\\Hero ";

String sb_classname_brute     = "Brute";
String sb_classname_ninja     = "Ninja";
String sb_classname_ranger    = "Ranger";
String sb_classname_runeblade = "Runeblade";
String sb_classname_warrior   = "Warrior";
String sb_classname_wizard    = "Wizard";

String sb_heroname_aria    = "(Aria)";
String sb_heroname_demon   = "(Demonastery)";
String sb_heroname_mech    = "(Metrix)";
String sb_heroname_mist    = "(Misteria)";
String sb_heroname_savage  = "(Savage Lands)";
String sb_heroname_solanas = "(Solana Special)";
String sb_heroname_solana  = "(Solana)";
String sb_heroname_pits    = "(The Pits)";
String sb_heroname_volcor  = "(Volcor)";

public PImage getImageFromValues(Card pC)
{

  String imagelocstr = "" + sb_start;

  // Is Hero, Action Or Token?
  switch(pC.type)
  {
    case "Action":
      imagelocstr += sb_class;
      switch(pC.classtype)
      {
        case "Brute":
          imagelocstr += sb_classname_brute + "\\" + sb_classname_brute;
          break;
        case "Ninja":
          imagelocstr += sb_classname_ninja + "\\" + sb_classname_ninja;
          break;
        case "Ranger":
          imagelocstr += sb_classname_ranger + "\\" + sb_classname_ranger;
          break;
        case "Runeblade":
          imagelocstr += sb_classname_runeblade + "\\" + sb_classname_runeblade;
          break;
        case "Warrior":
          imagelocstr += sb_classname_warrior + "\\" + sb_classname_warrior;
          break;
        case "Wizard":
          imagelocstr += sb_classname_wizard + "\\" + sb_classname_wizard;
          break;
      }

      switch(pC.actiontype)
      {
        case "Attack":
          imagelocstr += " Attack ";
          break;
        case "Instant":
          imagelocstr += " Instant ";
          break;
        case "NonAttack":
          imagelocstr += " Non Attack ";
          break;
      }

      switch(pC.pitch)
      {
        case "0":
          imagelocstr += "(0)";
          break;
        case "1":
          imagelocstr += "(1)";
          break;
        case "2":
          imagelocstr += "(2)";
          break;
        case "3":
          imagelocstr += "(3)";
          break;
      }

      break;

    case "Hero":
      imagelocstr += sb_hero;
      switch(pC.region)
      {
        case "Aria":
          imagelocstr += sb_heroname_aria;
          break;
        case "Demon":
          imagelocstr += sb_heroname_demon;
          break;
        case "Mech":
          imagelocstr += sb_heroname_mech;
          break;
        case "Mist":
          imagelocstr += sb_heroname_mist;
          break;
        case "Savage":
          imagelocstr += sb_heroname_savage;
          break;
        case "SolanaS":
          imagelocstr += sb_heroname_solanas;
          break;
        case "Solana":
          imagelocstr += sb_heroname_solana;
          break;
        case "Pits":
          imagelocstr += sb_heroname_pits;
          break;
        case "Volcor":
          imagelocstr += sb_heroname_volcor;
          break;
      }
      break;

    case "Token":
      break;
  }

  return loadImage(imagelocstr + ".png");

}

