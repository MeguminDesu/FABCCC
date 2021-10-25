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
