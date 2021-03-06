/* autogenerated by Processing revision 1276 on 2021-10-25 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import drop.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class FAB_CCC extends PApplet {



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
  /* size commented out by preprocessor */;

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
    new PVector(card.pos.x + card.size.x+50+125+62.5f, card.pos.y - 125),
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
public class Card
{
  public PVector pos;
  public PVector size;

  private int titleoffsety = 55;
  private int costoffsetx, costoffsety;

  private int textbufferx   = 50;
  private int textboundstop = 400;
  private int textboundsbot = 550;

  private int typeposy = 572;

  private int atkposx = 85;
  private int atkposy = 580;
  private int defposx = 85;
  private int defposy = 580;

  // Generic
  public String  title  = "Megumin, Crimson Demon";
  public String  text   = "Once Per Turn Action:\nDeal 40 arcane damage to all players.";
  public String  cost   = "2";
  public String  pitch  = "3";

  public String  atkv   = "0";
  public String  defv   = "0";

  public String type       = "Hero";
  public String region     = "Aria";
  public String classtype  = "Wizard";
  public String actiontype = "";
  public boolean young     = true;

  // Hero Speicifc
  public String  health = "40";
  public String  intel  = "4";

  // Image
  public PImage border = loadImage(".\\img\\class_frame\\Brute\\Brute Attack (1).png");
  public PImage back   = loadImage("./megumin.jpg");

  public Card(PVector pPos, PVector pSize)
  {
    this.pos  = pPos;
    this.size = pSize;

    this.costoffsetx = floor(this.size.x-396);
    this.costoffsety = -5;
  }

  public void render()
  {
    if (this.back   != null) { image(this.back  , this.pos.x + 10, this.pos.y + 10, this.size.x - 20, this.size.y-20); }
    if (this.border != null) { image(this.border, this.pos.x , this.pos.y, this.size.x, this.size.y); }

    // Title
    textFont(FABCCC_Title, 32); fill(0); stroke(0);
    textAlign(CENTER, CENTER);

    if (this.type == "Action")
      text(this.title, this.pos.x+this.size.x/2, this.pos.y + this.titleoffsety);
    if (this.type == "Hero")
      text(this.title, this.pos.x+this.size.x/2, this.pos.y + this.titleoffsety - 5);

    // Text
    // Bounds: 400, 550
    textFont(FABCCC_Text, 16); fill(0); stroke(0);
    textAlign(LEFT, CENTER);
    text(this.text, this.pos.x+this.textbufferx, this.pos.y+textboundstop,
                    this.size.x-(this.textbufferx*2), this.textboundsbot-this.textboundstop);


    if (this.type == "Action") {
      // Cost
      textFont(FABCCC_Title, 28);
      text(this.cost, this.pos.x+this.size.x-this.costoffsetx, this.pos.y + this.titleoffsety + this.costoffsety);

      textFont(FABCCC_Title, 32); fill(0); stroke(0);
      textAlign(CENTER, CENTER);
      // Atk
      if (this.actiontype == "Attack")
      {
        text(this.atkv, this.pos.x + this.atkposx, this.pos.y + this.atkposy);
      }

      // Def
      if (this.actiontype == "Attack" || this.actiontype == "NonAttack")
      {
        text(this.defv, this.pos.x + this.size.x - this.defposx, this.pos.y + this.defposy);
      }
    }

    if (this.type == "Hero") {
      // Atk
      textFont(FABCCC_Title, 32); fill(0); stroke(0);
      textAlign(CENTER, CENTER);
      text(this.intel, this.pos.x + this.atkposx, this.pos.y + this.atkposy);

      // Def
      text(this.health, this.pos.x + this.size.x - this.defposx, this.pos.y + this.defposy);
    }

    textFont(FABCCC_Title, 22); fill(0); stroke(0);
    textAlign(CENTER, CENTER);

    String f = this.classtype + " " + this.type;
    if (this.actiontype == "NonAttack") {}
    else if (this.actiontype != "") f += " - " + this.actiontype;
    else if (this.young) f += " - Young";
    text(f, this.pos.x + this.size.x/2, this.pos.y + this.typeposy);
  }


  public void updatevalues()
  {
    this.title  = inputs.get(1).display;
    this.text   = inputs.get(2).display;
    this.intel  = inputs.get(8).display;
    this.atkv   = inputs.get(8).display;
    this.health = inputs.get(9).display;
    this.defv   = inputs.get(9).display;
    this.cost   = inputs.get(10).display;

    this.border = getImageFromValues(this);
    return;
  }
}
 public void dropEvent(DropEvent theDropEvent) {
  // returns true if the dropped object is an image from
  // the harddisk or the browser.
  println("isImage()\t"+theDropEvent.isImage());
  if (theDropEvent.isImage())
  {
    card.back = theDropEvent.loadImage();
    card.updatevalues();
  }
}
public class Input
{
  public PVector pos;
  public PVector size;

  public String type;
  public String display = "";

  private String opcode = "";

  public String inp_type = "button";

  public boolean selected = false;
  public boolean greyed   = false;

  public Input(PVector pPos, PVector pSize, String pType, String pDisplay, String pOpcode)
  {
    this.pos     = pPos;
    this.size    = pSize;
    this.type    = pType;
    this.display = pDisplay;
    this.opcode  = pOpcode;
  }
  public Input(PVector pPos, PVector pSize, String pType, String pDisplay, String pOpcode, boolean pGreyed)
  {
    this(pPos, pSize, pType, pDisplay, pOpcode);
    this.greyed = pGreyed;
  }

  public  void render()
  {
    if (this.greyed) fill(187);
    else fill(255);
    stroke(0); if (this.selected) strokeWeight(3); else strokeWeight(1);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y, 10, 10, 10, 10);

    textAlign(CENTER, CENTER);
    textFont(FABCCC_Title, 40); fill(0); stroke(0);
    text(this.display, this.pos.x, this.pos.y, this.size.x, this.size.y);
  }

  public void onClick()
  {
    switch(this.opcode)
    {

      case "exportimg":
        PImage cardimg = createImage(floor(card.size.x), floor(card.size.y), ARGB);
        cardimg.loadPixels();
        for (int i = 0; i < card.size.x; i++)
        {
          for (int j = 0; j < card.size.y; j++)
          {
            cardimg.pixels[floor(i + j*card.size.x)] = get(floor(card.pos.x + i), floor(card.pos.y + j));
          }
        }
        cardimg.save(card.title + ".jpg");
        break;

      case "changetohero":
        card.type = "Hero";
        card.actiontype = "";
        inputs.get(5).greyed = true;
        inputs.get(6).greyed = true;
        inputs.get(7).greyed = true;
        inputs.get(11).greyed = true;
        inputs.get(12).greyed = true;
        inputs.get(13).greyed = true;
        inputs.get(14).greyed = false;
        break;
      case "changetoaction":
        card.type = "Action";
        card.actiontype = "Attack";
        inputs.get(5).greyed = false;
        inputs.get(6).greyed = false;
        inputs.get(7).greyed = false;
        inputs.get(11).greyed = false;
        inputs.get(12).greyed = false;
        inputs.get(13).greyed = false;
        inputs.get(14).greyed = true;
        break;
      case "changetoattack":
        card.actiontype = "Attack";
        break;
      case "changetononattack":
        card.actiontype = "NonAttack";
        break;
      case "changetoinstant":
        card.actiontype = "Instant";
        break;
      case "changepitch1":
        card.pitch = "1";
        break;
      case "changepitch2":
        card.pitch = "2";
        break;
      case "changepitch3":
        card.pitch = "3";
        break;
      case "toggleyoung":
        card.young = !card.young;
        break;
      case "changeto_brute":
        card.classtype = "Brute";
        break;
      case "changeto_ninja":
        card.classtype = "Ninja";
        break;
      case "changeto_ranger":
        card.classtype = "Ranger";
        break;
      case "changeto_runeblade":
        card.classtype = "Runeblade";
        break;
      case "changeto_warrior":
        card.classtype = "Warrior";
        break;
      case "changeto_wizard":
        card.classtype = "Wizard";
        break;

      case "changeto_aria":
        card.region = "Aria";
        break;
      case "changeto_demon":
        card.region = "Demon";
        break;
      case "changeto_mech":
        card.region = "Mech";
        break;
      case "changeto_mist":
        card.region = "Mist";
        break;
      case "changeto_savage":
        card.region = "Savage";
        break;
      case "changeto_solana":
        card.region = "Solana";
        break;
      default:
        break;
    
    }
    card.updatevalues();
  }

  public void keypress(int pKey)
  {
    if      (pKey == 0 && this.display.length() > 0) this.display = this.display.substring(0, this.display.length()-1);
    else if (pKey == 0) return;
    else if (pKey == 1) this.display += "\n";
    else this.display += PApplet.parseChar(pKey);

    card.updatevalues();
  }

}


  public void settings() { fullScreen(); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FAB_CCC" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
