
import drop.*;
SDrop drop;

PFont FABCCC_Title;
PFont FABCCC_Text;

PImage bgimg;

int cardx, cardy;
int cardbufferx, cardbuffery;

Input currentInput = null;

Card card;

ArrayList<Input> inputs = new ArrayList<Input>();

public void setup()
{
  drop = new SDrop(this);

  // Load Fonts
  FABCCC_Title = createFont(".\\font\\cardtitle.otf", 32);
  FABCCC_Text  = createFont(".\\font\\cardtext.otf", 16);

  // Load Background
  bgimg = loadImage(".\\img\\misc\\background.jpg");

  // Setup Screen
  // size(1600, 900); background(0);
  fullScreen();

  cardx = 450;
  cardy = 628;

  cardbufferx = 50;
  cardbuffery = (height-cardy)/2;

  // Setup Base/Default Card
  card = new Card(
    new PVector(cardbufferx, cardbuffery),
    new PVector(cardx, cardy)
  );

  // Get initial Frame
  card.border = getImageFromValues(card);


  // Setup Inputs
  // Export Image
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x/4, card.pos.y + card.size.y + card.pos.y/4),
    new PVector(card.size.x / 2, card.pos.y/2),
    "button",
    "Export",
    "exportimg"
  ));
  currentInput = inputs.get(0);

  // Title
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50, card.pos.y + 50),
    new PVector(500, 50),
    "textBox",
    card.title,
    "changetitle"
  ));

  // Text
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50, card.pos.y + 125),
    new PVector(500, 600),
    "textBox",
    card.text,
    "changetext"
  ));

  // Hero
  inputs.add(new Input(
    new PVector(card.pos.x, card.pos.y - 125),
    new PVector(card.size.x/2, 100),
    "button",
    "Change To Hero",
    "changetohero"
  ));

  // Action
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x/2, card.pos.y - 125),
    new PVector(card.size.x/2, 100),
    "button",
    "Change To Action",
    "changetoaction"
  ));

  // Action Types
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x+50, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Attack",
    "changetoattack",
    true
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x+50+125+62.5, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Non Attack",
    "changetononattack",
    true
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x+550-125, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Instant",
    "changetoinstant",
    true
  ));

  // Atk/Int,Def/Health
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550, card.pos.y + 125),
    new PVector(125, 100),
    "textBox",
    "4",
    "changeatkint"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550 + 150, card.pos.y + 125),
    new PVector(125, 100),
    "textBox",
    "40",
    "changedefhealth"
  ));

  // Cost
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550 + 300, card.pos.y + 125),
    new PVector(125, 100),
    "textBox",
    "0",
    "changeCost"
  ));

  // Pitch
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Red",
    "changepitch1",
    true
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550 + 150, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Yellow",
    "changepitch2",
    true
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 50 + 550 + 300, card.pos.y - 125),
    new PVector(125, 100),
    "button",
    "Blue",
    "changepitch3",
    true
  ));

  // Toggle Young
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 50),
    new PVector(425, 50),
    "button",
    "Toggle Young",
    "toggleyoung"
  ));

  // Change Class
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y +225 + 75),
    new PVector(200, 50),
    "button",
    "Brute",
    "changeto_brute"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 225 + 75*2),
    new PVector(200, 50),
    "button",
    "Ninja",
    "changeto_ninja"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 225 + 75*3),
    new PVector(200, 50),
    "button",
    "Ranger",
    "changeto_ranger"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 225 + 75*4),
    new PVector(200, 50),
    "button",
    "Runeblade",
    "changeto_runeblade"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 225 + 75*5),
    new PVector(200, 50),
    "button",
    "Warrior",
    "changeto_warrior"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 600, card.pos.y + 225 + 75*6),
    new PVector(200, 50),
    "button",
    "Wizard",
    "changeto_wizard"
  ));


  // Change Region
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y +225 + 75),
    new PVector(200, 50),
    "button",
    "Aria",
    "changeto_aria"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y + 225 + 75*2),
    new PVector(200, 50),
    "button",
    "Demon",
    "changeto_demon"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y + 225 + 75*3),
    new PVector(200, 50),
    "button",
    "Metrix",
    "changeto_mech"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y + 225 + 75*4),
    new PVector(200, 50),
    "button",
    "Misteria",
    "changeto_mist"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y + 225 + 75*5),
    new PVector(200, 50),
    "button",
    "Savage Lands",
    "changeto_savage"
  ));
  inputs.add(new Input(
    new PVector(card.pos.x + card.size.x + 825, card.pos.y + 225 + 75*6),
    new PVector(200, 50),
    "button",
    "Solana",
    "changeto_solana"
  ));
}


public void draw()
{  background(127);
  image(bgimg, 0, 0, width, height);
  // Draw Updated Card
  card.render();

  // Draw Input Boxes
  for (Input i : inputs) i.render();
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


public void keyPressed()
{
  if (key == 8)       currentInput.keypress(0);
  else if (key == 10) currentInput.keypress(1);
  else if (key >= 32 && key <= 126)
  {
    if (currentInput.type == "textBox") currentInput.keypress(key);
  }
}

public void mousePressed()
{
  int mX = mouseX, mY = mouseY;

  Input clickedInput = null;

  for (int x = inputs.size()-1; x >= 0; x--)
  {
    Input i = inputs.get(x);
    if (mX >= i.pos.x && mX <= i.pos.x + i.size.x
    &&  mY >= i.pos.y && mY <= i.pos.y + i.size.y)
    {
      if (i.greyed) continue;
      else
      {
        clickedInput = i;
        break;
      }
    }
  }

  if (clickedInput == null) return;
  else
  {
    currentInput.selected = false;
    if (clickedInput.type == "textBox") currentInput = clickedInput;
    currentInput.selected = true;
    clickedInput.onClick();
  }
}
