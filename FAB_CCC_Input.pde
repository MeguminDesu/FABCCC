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
    else this.display += char(pKey);

    card.updatevalues();
  }

}
