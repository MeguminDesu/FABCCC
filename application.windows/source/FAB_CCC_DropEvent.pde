void dropEvent(DropEvent theDropEvent) {
  // returns true if the dropped object is an image from
  // the harddisk or the browser.
  println("isImage()\t"+theDropEvent.isImage());
  if (theDropEvent.isImage())
  {
    card.back = theDropEvent.loadImage();
    card.updatevalues();
  }
}
